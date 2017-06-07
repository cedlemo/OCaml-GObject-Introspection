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

open BuilderUtils

(* TODO : test,
 *        finalise the enum declaration
 *        find the mli signature *)
let append_ctypes_enum_constants_declarations info (mli, ml) =
  let tag = GIEnumInfo.get_storage_type info in
  let tag_typ = type_tag_to_ctypes_typ_string tag in
  let n = GIEnumInfo.get_n_values info in
  for i = 0 to n - 1 do
    match GIEnumInfo.get_value info i with
    | None -> ()
    | Some value -> let value_base_info = GIValueInfo.to_baseinfo value in
      match GIBaseInfo.get_name value_base_info with
      | None -> ()
      | Some const_name -> let const_name_low_case = String.lowercase_ascii const_name in
        if i = 0 then Printf.fprintf ml "let %s = constant \"%s\" %s" const_name_low_case const_name tag_typ
        else Printf.fprintf ml "and %s = constant \"%s\" %s" const_name_low_case const_name tag_typ
  done
