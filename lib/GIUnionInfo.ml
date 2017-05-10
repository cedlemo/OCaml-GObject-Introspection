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
let unioninfo : t structure typ = structure "GIUnionInfo"

let get_n_fields =
  foreign "g_union_info_get_n_fields"
    (ptr unioninfo @-> returning int)

let get_size =
  foreign "g_union_info_get_size"
    (ptr unioninfo @-> returning int)

let get_alignment =
  foreign "g_union_info_get_alignment"
    (ptr unioninfo @-> returning int)

let get_n_methods =
  foreign "g_union_info_get_n_methods"
    (ptr unioninfo @-> returning int)

let get_field info n =
  let get_field_raw =
    foreign "g_union_info_get_field"
      (ptr unioninfo @-> int @-> returning (ptr GIFieldInfo.fieldinfo)) in
  let max = get_n_fields info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_field_raw info n in
    GIFieldInfo.add_unref_finaliser info'

let get_method info n =
  let get_method_raw =
    foreign "g_union_info_get_method"
      (ptr unioninfo @-> int @-> returning (ptr GIFunctionInfo.functioninfo)) in
  let max = get_n_methods info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_method_raw info n in
    GIFunctionInfo.add_unref_finaliser info'

let find_method info name =
  let find_method_raw =
    foreign "g_union_info_find_method"
    (ptr unioninfo @-> string @-> returning (ptr_opt GIFunctionInfo.functioninfo))
  in match find_method_raw info name with
  | None -> None
  | Some info' ->
    let fn_info = GIFunctionInfo.add_unref_finaliser info' in
    Some fn_info

let is_discriminated =
  foreign "g_union_info_is_discriminated"
    (ptr unioninfo @-> returning bool)

(* TODO : check that the info can be casted to a unioninfo ? *)
let cast_from_baseinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr unioninfo) info

let cast_to_baseinfo info =
  coerce (ptr unioninfo) (ptr GIBaseInfo.baseinfo) info

let from_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_from_baseinfo info in
  let _ = Gc.finalise (fun i ->
      let i' = cast_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info' in
  info'

let to_baseinfo info =
  let info' = cast_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'
