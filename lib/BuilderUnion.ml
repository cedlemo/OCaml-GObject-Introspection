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

let append_ctypes_union_declaration name sources_files =
  let (mli, ml) = sources_files in
  Printf.fprintf mli "type t\n%!";
  Printf.fprintf mli "val t_typ : t union typ\n%!";
  Printf.fprintf ml "type t\n%!";
  Printf.fprintf ml "let t_typ : t union typ = union \"%s\"\n" name

let append_ctypes_union_fields_declarations struct_name info sources_files =
  let (mli, ml) = sources_files in
  let append_ctypes_union_field_declarations field_info =
    let base_info = GIFieldInfo.to_baseinfo field_info in
    match GIBaseInfo.get_name base_info with
    | None -> ()
    | Some name ->
      let type_info = GIFieldInfo.get_type field_info in
      let is_pointer = GITypeInfo.is_pointer type_info in
      let tag = GITypeInfo.get_tag type_info in
      let (mli_type, ml_type) = BuilderUtils.type_tag_to_ctypes_strings tag in
      if mli_type == "" then ()
      else
      let (mli_type', ml_type') = if is_pointer then (mli_type ^ " ptr", "ptr " ^ ml_type)
        else (mli_type, ml_type) in
      Printf.fprintf mli "val f_%s: (%s, t union) field\n" name mli_type';
      Printf.fprintf ml "let f_%s = field t_typ \"%s\" (%s)\n" name name ml_type'
  in
  let n = GIUnionInfo.get_n_fields info in
  for i = 0 to n - 1 do
    let field_info = GIUnionInfo.get_field info i in
    append_ctypes_union_field_declarations field_info
  done

let append_ctypes_union_seal ml_descr =
  Printf.fprintf ml_descr "let _ = seal t_typ\n"
