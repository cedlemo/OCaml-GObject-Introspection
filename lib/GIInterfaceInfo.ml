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
let interfaceinfo : t structure typ = structure "GIInterfaceInfo"

let get_n_prerequisites =
  foreign "g_interface_info_get_n_prerequisites"
    (ptr interfaceinfo @-> returning int)

let get_prerequisite info n =
  let get_prerequisite_raw =
    foreign "g_interface_info_get_prerequisite"
      (ptr interfaceinfo @-> int @-> returning (ptr GIBaseInfo.baseinfo)) in
  let max = get_n_prerequisites info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_prerequisite_raw info n in
    GIBaseInfo.add_unref_finaliser info'

let get_n_properties =
  foreign "g_interface_info_get_n_properties"
    (ptr interfaceinfo @-> returning int)

let get_property info n =
  let get_property_raw =
    foreign "g_interface_info_get_property"
      (ptr interfaceinfo @-> int @-> returning (ptr GIPropertyInfo.propertyinfo)) in
  let max = get_n_properties info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_property_raw info n in
    GIPropertyInfo.add_unref_finaliser info'

let get_n_methods =
  foreign "g_interface_info_get_n_methods"
    (ptr interfaceinfo @-> returning int)

let get_method info n =
  let get_method_raw =
    foreign "g_interface_info_get_method"
      (ptr interfaceinfo @-> int @-> returning (ptr GIFunctionInfo.functioninfo)) in
  let max = get_n_methods info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_method_raw info n in
    GIFunctionInfo.add_unref_finaliser info'

let find_method info name =
  let find_method_raw =
    foreign "g_interface_info_find_method"
      (ptr interfaceinfo @-> string @-> returning (ptr_opt GIFunctionInfo.functioninfo)) in
  match find_method_raw info name with
  | None -> None
  | Some info' -> let info'' = GIFunctionInfo.add_unref_finaliser info' in
    Some info''

let get_n_signals =
  foreign "g_interface_info_get_n_signals"
    (ptr interfaceinfo @-> returning int)

let get_signal info n =
  let get_signal_raw =
    foreign "g_interface_info_get_signal"
      (ptr interfaceinfo @-> int @-> returning (ptr GISignalInfo.signalinfo)) in
  let max = get_n_signals info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_signal_raw info n in
    GISignalInfo.add_unref_finaliser info'

let find_signal info name =
  let find_signal_raw =
    foreign "g_interface_info_find_signal"
      (ptr interfaceinfo @-> string @-> returning (ptr_opt GISignalInfo.signalinfo)) in
  match find_signal_raw info name with
  | None -> None
  | Some info' -> let info'' = GISignalInfo.add_unref_finaliser info' in
    Some info''

let get_n_constants =
  foreign "g_interface_info_get_n_constants"
    (ptr interfaceinfo @-> returning int)

(* TODO : test *)
let get_constant info n =
  let get_constant_raw =
    foreign "g_interface_info_get_constant"
      (ptr interfaceinfo @-> int @-> returning (ptr GIConstantInfo.constantinfo)) in
  let max = get_n_constants info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_constant_raw info n in
    GIConstantInfo.add_unref_finaliser info'

(* TODO : check that the info can be casted to interface info ? *)
let cast_from_baseinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr interfaceinfo) info

let cast_to_baseinfo info =
  coerce (ptr interfaceinfo) (ptr GIBaseInfo.baseinfo) info

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
