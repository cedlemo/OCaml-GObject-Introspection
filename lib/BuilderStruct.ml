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

let append_ctypes_struct_declaration name sources_files =
  let (mli, ml) = sources_files in
  Printf.fprintf mli "type t\n%!";
  Printf.fprintf mli "val t_typ : t structure typ\n%!";
  Printf.fprintf ml "type t\n%!";
  Printf.fprintf ml "let t_typ : t structure typ = structure \"%s\"\n" name

let handle_recursive_structure structure_name (ocaml_type, ctypes_typ) =
  if (structure_name ^ ".t structure") = ocaml_type then ("t structure", "t_typ")
  else if (structure_name ^ ".t structure ptr") = ocaml_type then ("t structure ptr", "ptr t_typ")
  else (ocaml_type, ctypes_typ)

let append_ctypes_struct_fields_declarations struct_name info sources_files =
  let (mli, ml) = sources_files in
  let append_ctypes_struct_field_declarations field_info =
    let base_info = GIFieldInfo.to_baseinfo field_info in
    match GIBaseInfo.get_name base_info with
    | None -> ()
    | Some name ->
      let type_info = GIFieldInfo.get_type field_info in
      match BuilderUtils.type_info_to_bindings_types type_info false with
      | Not_implemented tag_name -> let coms = Printf.sprintf "TODO Struct field %s : %s tag not implemented" struct_name tag_name in
        BuilderUtils.add_comments mli coms;
        BuilderUtils.add_comments ml coms
      | Types {ocaml = ocaml_type; ctypes = ctypes_typ } ->
        let (ocaml_type', ctypes_typ') = handle_recursive_structure struct_name (ocaml_type, ctypes_typ) in
        Printf.fprintf mli "val f_%s: (%s, t structure) field\n" name ocaml_type';
        Printf.fprintf ml "let f_%s = field t_typ \"%s\" (%s)\n" name name ctypes_typ'
  in
  let n = GIStructInfo.get_n_fields info in
  for i = 0 to n - 1 do
    let field_info = GIStructInfo.get_field info i in
    append_ctypes_struct_field_declarations field_info
  done

let append_ctypes_struct_methods_bindings struct_name info sources_files =
  let n = GIStructInfo.get_n_methods info in
  for i = 0 to n - 1 do
    let method_info = GIStructInfo.get_method info i in
    let base_info = GIFunctionInfo.to_baseinfo method_info in
    match GIBaseInfo.get_name base_info with
    | None -> ()
    | Some name ->
        BuilderFunction.append_ctypes_method_bindings name method_info struct_name sources_files
  done

let append_ctypes_struct_seal ml_descr =
  Printf.fprintf ml_descr "let _ = seal t_typ\n%!"
