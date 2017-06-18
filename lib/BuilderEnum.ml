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

let base_name_for_enum name =
  let pattern = Str.regexp "\\(.*\\)\\(Type\\|Flags\\)" in
  if Str.string_match pattern name 0 then Str.matched_group 1 name
  else name

let rebuild_c_identifier_for_constant enum_name value_info =
  let base_info = GIValueInfo.to_baseinfo value_info in
  let namespace = GIBaseInfo.get_namespace base_info in
  let repo = GIRepository.get_default () in
  let c_prefix = GIRepository.get_c_prefix repo namespace in
  match GIBaseInfo.get_name base_info with
  | None -> raise (Failure "It should have a name")
  | Some name -> let lower_case = String.concat "_" [c_prefix; base_name_for_enum enum_name; name] in
    String.uppercase_ascii lower_case

let append_ctypes_enum_constants_declarations enum_name info (mli, ml) =
  let tag = GIEnumInfo.get_storage_type info in
  let tag_typ = type_tag_to_ctypes_typ_string tag in
  let n = GIEnumInfo.get_n_values info in
  for i = 0 to n - 1 do
    match GIEnumInfo.get_value info i with
    | None -> ()
    | Some value -> let value_base_info = GIValueInfo.to_baseinfo value in
      if GIBaseInfo.is_deprecated value_base_info then ()
      else match GIBaseInfo.get_name value_base_info with
      | None -> ()
      | Some const_name -> let const_name = BuilderUtils.ensure_valid_variable_name const_name in
        let c_identifier = rebuild_c_identifier_for_constant enum_name value in
        if i = 0 then Printf.fprintf ml "let %s = constant \"%s\" %s\n" const_name c_identifier tag_typ
        else Printf.fprintf ml "and %s = constant \"%s\" %s\n" const_name c_identifier tag_typ
  done

let append_ctypes_enum_declaration enum_name info (mli, ml) =
  let n = GIEnumInfo.get_n_values info in
  let rec get_variants_and_constants_names i v_c =
      if i == n then (List.rev v_c)
      else
      match GIEnumInfo.get_value info i with
      | None -> get_variants_and_constants_names (i + 1) v_c
      | Some value -> let value_base_info = GIValueInfo.to_baseinfo value in
      if GIBaseInfo.is_deprecated value_base_info then get_variants_and_constants_names (i + 1) v_c
      else match GIBaseInfo.get_name value_base_info with
        | None -> get_variants_and_constants_names (i + 1) v_c
        | Some const_name ->
          get_variants_and_constants_names (i + 1) ((String.capitalize_ascii const_name,
                                                     BuilderUtils.ensure_valid_variable_name const_name) :: v_c)
  in
  let v_and_c = get_variants_and_constants_names 0 [] in
  Printf.fprintf ml "let %s : [" (String.lowercase_ascii enum_name);
  Printf.fprintf ml "%s" (String.concat "|" (List.map (fun (v,c) -> "`" ^ v) v_and_c));
  Printf.fprintf ml "] typ = enum \"%s\" [\n" (String.lowercase_ascii enum_name);
  let str = String.concat ";\n" (List.map (fun (v, c) -> String.concat "" ["`"; v; ", "; c]) v_and_c) in
  Printf.fprintf ml "%s\n]\n" str
