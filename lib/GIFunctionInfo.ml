(*
 * Copyright 2017 Cedric LE MOIGNE, cedlemo@gmx.com
 * This file is part of OCaml-GObject-Introspection.
 *
 * OCaml-GObject-Introspection is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * OCaml-GObject-Introspection is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OCaml-GObject-Introspection.  If not, see <http://www.gnu.org/licenses/>.
 *)

open Ctypes
open Foreign

type t
let functioninfo : t structure typ = structure "GIFunctionInfo"

let get_symbol =
  foreign "g_function_info_get_symbol"
    (ptr functioninfo @-> returning string)

type flags =
  | Is_method
  | Is_constructor
  | Is_getter
  | Is_setter
  | Wraps_vfunc
  | Throws

let get_flags info =
  let get_flags_raw =
    foreign "g_function_info_get_flags"
      (ptr functioninfo @-> returning int)
  in let flags = [] in
  let c_flags = get_flags_raw info in
  if ((c_flags land (1 lsl 0)) != 0) then ignore (Is_method :: flags);
  if ((c_flags land (1 lsl 1)) != 0) then ignore (Is_constructor :: flags);
  if ((c_flags land (1 lsl 2)) != 0) then ignore (Is_getter :: flags);
  if ((c_flags land (1 lsl 3)) != 0) then ignore (Is_setter :: flags);
  if ((c_flags land (1 lsl 4)) != 0) then ignore (Wraps_vfunc :: flags);
  if ((c_flags land (1 lsl 5)) != 0) then ignore (Throws :: flags);
  flags

let get_property info =
  let flags = get_flags info in
  let rec find_set_get = function
    | [] -> false
    | h :: q -> match h with
      | Is_setter | Is_getter -> true
      | _ -> find_set_get q
  in if (find_set_get flags) then (
    let get_property_raw =
      foreign "g_function_info_get_property"
        (ptr functioninfo @-> returning (ptr_opt GIPropertyInfo.propertyinfo)) in
    match get_property_raw info with
    | None -> None
    | Some info' -> let info'' = GIPropertyInfo.add_unref_finaliser info' in
      Some info''
  )
  else None

(* TODO : check that the info can be casted to function info ? *)
let cast_from_baseinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr functioninfo) info

let cast_to_baseinfo info =
  coerce (ptr functioninfo) (ptr GIBaseInfo.baseinfo) info

let add_unref_finaliser info =
  let _ = Gc.finalise (fun i ->
      let i' = cast_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info
  in info

let from_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_from_baseinfo info in
  add_unref_finaliser info'

let to_baseinfo info =
  let info' = cast_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'

let cast_from_callableinfo info =
  coerce (ptr GICallableInfo.callableinfo) (ptr functioninfo) info

let cast_to_callableinfo info =
  coerce (ptr functioninfo) (ptr GICallableInfo.callableinfo) info

let to_callableinfo info =
  let info' = cast_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let info'' = cast_to_callableinfo info in
  GICallableInfo.add_unref_finaliser info''

let from_callableinfo info =
  let info' = GICallableInfo.cast_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let info'' = cast_from_callableinfo info in
  let _ = Gc.finalise (fun i ->
      let i' = cast_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info'' in
  info''
