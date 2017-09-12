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

open Binding_utils

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
    let base_info = Field_info.to_baseinfo field_info in
    match Base_info.get_name base_info with
    | None -> ()
    | Some name ->
      let type_info = Field_info.get_type field_info in
      match Binding_utils.type_info_to_bindings_types type_info false with
      | Not_implemented tag_name -> let coms = Printf.sprintf "TODO Struct field %s : %s tag not implemented" struct_name tag_name in
        Binding_utils.add_comments mli coms;
        Binding_utils.add_comments ml coms
      | Types {ocaml = ocaml_type; ctypes = ctypes_typ } ->
        let (ocaml_type', ctypes_typ') = handle_recursive_structure struct_name (ocaml_type, ctypes_typ) in
        Printf.fprintf mli "val f_%s: (%s, t structure) field\n" name ocaml_type';
        Printf.fprintf ml "let f_%s = field t_typ \"%s\" (%s)\n" name name ctypes_typ'
  in
  let n = Struct_info.get_n_fields info in
  for i = 0 to n - 1 do
    let field_info = Struct_info.get_field info i in
    append_ctypes_struct_field_declarations field_info
  done

let append_ctypes_struct_methods_bindings struct_name info sources_files =
  let n = Struct_info.get_n_methods info in
  for i = 0 to n - 1 do
    let method_info = Struct_info.get_method info i in
    let base_info = Function_info.to_baseinfo method_info in
    match Base_info.get_name base_info with
    | None -> ()
    | Some name ->
        Bind_function.append_ctypes_method_bindings name method_info struct_name sources_files
  done

let append_ctypes_struct_seal ml_descr =
  Printf.fprintf ml_descr "let _ = seal t_typ\n%!"

let parse_struct_info info source_files =
  match get_binding_name info with
  | None -> ()
  | Some name -> let f_descrs = (source_files.mli.descr,
                                 source_files.ml.descr) in
    let info' = Struct_info.from_baseinfo info in
    append_ctypes_struct_declaration name f_descrs;
    append_ctypes_struct_fields_declarations name info' f_descrs;
    append_ctypes_struct_methods_bindings name info' f_descrs;
    add_empty_line source_files.mli.descr;
    add_empty_line source_files.ml.descr


