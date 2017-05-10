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
open Conversions

type t
let objectinfo : t structure typ = structure "GIObjectInfo"

let get_abstract =
  foreign "g_object_info_get_abstract"
    (ptr objectinfo @-> returning bool)

let get_fundamental =
  foreign "g_object_info_get_fundamental"
    (ptr objectinfo @-> returning bool)

let get_parent info =
  let get_parent_raw =
    foreign "g_object_info_get_parent"
      (ptr objectinfo @-> returning (ptr GIBaseInfo.baseinfo)) in
  let info' = get_parent_raw info in
  GIBaseInfo.add_unref_finaliser_to_base_info info'

let get_type_name =
  foreign "g_object_info_get_type_name"
    (ptr objectinfo @-> returning string)

let get_type_init =
  foreign "g_object_info_get_type_init"
    (ptr objectinfo @-> returning string)

let get_n_constants =
  foreign "g_object_info_get_n_constants"
    (ptr objectinfo @-> returning int)

let get_constant info n =
  let get_constant_raw =
    foreign "g_object_info_get_constant"
      (ptr objectinfo @-> int @-> returning (ptr GIConstantInfo.constantinfo)) in
  let max = get_n_constants info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_constant_raw info n in
    GIConstantInfo.add_unref_finaliser_to_constant_info info'

let get_n_fields =
  foreign "g_object_info_get_n_fields"
    (ptr objectinfo @-> returning int)

let get_field info n =
  let get_field_raw =
    foreign "g_object_info_get_field"
      (ptr objectinfo @-> int @-> returning (ptr GIFieldInfo.fieldinfo)) in
  let max = get_n_fields info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_field_raw info n in
    GIFieldInfo.add_unref_finaliser_to_field_info info'

let get_n_interfaces =
  foreign "g_object_info_get_n_interfaces"
    (ptr objectinfo @-> returning int)

let get_interface info n =
  let get_interface_raw =
    foreign "g_object_info_get_interface"
      (ptr objectinfo @-> int @-> returning (ptr GIInterfaceInfo.interfaceinfo)) in
  let max = get_n_interfaces info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_interface_raw info n in
    GIInterfaceInfo.add_unref_finaliser_to_interface_info info'

let get_n_methods =
  foreign "g_object_info_get_n_methods"
    (ptr objectinfo @-> returning int)

let get_method info n =
  let get_method_raw =
    foreign "g_object_info_get_method"
      (ptr objectinfo @-> int @-> returning (ptr GIFunctionInfo.functioninfo)) in
  let max = get_n_methods info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_method_raw info n in
    GIFunctionInfo.add_unref_finaliser info'

let find_method info name =
  let find_method_raw =
    foreign "g_object_info_find_method"
      (ptr objectinfo @-> string @-> returning (ptr_opt GIFunctionInfo.functioninfo)) in
  match find_method_raw info name with
  | None -> None
  | Some info' -> let info'' = GIFunctionInfo.add_unref_finaliser info' in
    Some info''

let get_n_properties =
  foreign "g_object_info_get_n_properties"
    (ptr objectinfo @-> returning int)

let get_property info n =
  let get_property_raw =
    foreign "g_object_info_get_property"
      (ptr objectinfo @-> int @-> returning (ptr GIPropertyInfo.propertyinfo)) in
  let max = get_n_properties info in
  if (n < 0 || n >= max) then raise (Failure "Array Index out of bounds")
  else let info' = get_property_raw info n in
    GIPropertyInfo.add_unref_finaliser_to_property_info info'

let get_n_signals =
  foreign "g_object_info_get_n_signals"
    (ptr objectinfo @-> returning int)

let get_n_vfuncs =
  foreign "g_object_info_get_n_vfuncs"
    (ptr objectinfo @-> returning int)

let get_class_struct info =
  let get_class_struct_raw =
    foreign "g_object_info_get_class_struct"
      (ptr objectinfo @-> returning (ptr_opt GIStructInfo.structinfo)) in
  match get_class_struct_raw info with
  | None -> None
  | Some info' -> let info'' = GIStructInfo.add_unref_finaliser_to_struct_info info' in
    Some info''

(* TODO : check that the info can be casted to object info ? *)
let cast_baseinfo_to_objectinfo info =
  coerce (ptr GIBaseInfo.baseinfo) (ptr objectinfo) info

let cast_objectinfo_to_baseinfo info =
  coerce (ptr objectinfo) (ptr GIBaseInfo.baseinfo) info

let add_unref_finaliser_to_object_info info =
  let _ = Gc.finalise (fun i ->
      let i' = cast_objectinfo_to_baseinfo i in
      GIBaseInfo.base_info_unref i') info
  in info

let objectinfo_of_baseinfo info =
  let _ = GIBaseInfo.base_info_ref info in
  let info' = cast_baseinfo_to_objectinfo info in
  add_unref_finaliser_to_object_info info'

let baseinfo_of_objectinfo info =
  let info' = cast_objectinfo_to_baseinfo info in
  let _ = GIBaseInfo.base_info_ref info' in
  let _ = Gc.finalise (fun i ->
      GIBaseInfo.base_info_unref i) info' in
  info'
