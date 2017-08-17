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

let append_enum_type enum_type_name values_and_variants descr =
  Printf.fprintf descr "type %s = " enum_type_name;
  Printf.fprintf descr "%s\n" (String.concat " | " (List.map (fun (_, v) -> v) values_and_variants))

let negative_int_in_parentheses value =
  if (String.get value 0 = '-') then String.concat " " ["("; value; ")"]
  else value

let value_info_to_enum_type_conversion ocaml_type value =
  if ocaml_type = "Unsigned.uint32" then "Unsigned.UInt32.of_int " ^ value
  else if (String.get value 0 = '-') then String.concat "" ["Int32.of_int "; "("; value; ")"]
  else  "Int32.of_int " ^ value

let append_enum_of_value_fn enum_name enum_type_name ocaml_type values_and_variants (mli, ml) =
  Printf.fprintf mli "val %s_of_value:\n%s -> %s\n" enum_type_name ocaml_type enum_type_name;
  Printf.fprintf ml "let %s_of_value v =\nif v = " enum_type_name;
  Printf.fprintf ml "%s" (String.concat "else if v = " (List.map (fun (x, v) ->
      String.concat "" [value_info_to_enum_type_conversion ocaml_type x; " then "; v; "\n"] ) values_and_variants));
  Printf.fprintf ml "else raise (Invalid_argument \"Unexpected %s value\")\n" enum_name

let append_enum_to_value_fn enum_name enum_type_name ocaml_type values_and_variants (mli, ml) =
  Printf.fprintf mli "val %s_to_value:\n%s -> %s\n" enum_type_name enum_type_name ocaml_type;
  Printf.fprintf ml "let %s_to_value = function\n| " enum_type_name;
  Printf.fprintf ml "%s" (String.concat "| " (List.map (fun (x, v) ->
      String.concat "" [v; " -> "; value_info_to_enum_type_conversion ocaml_type x; "\n"] ) values_and_variants))

let append_enum_view enum_type_name ctypes_typ (mli, ml) =
  Printf.fprintf mli "val %s : %s typ\n" enum_type_name enum_type_name;
  Printf.fprintf ml "let %s = view \n" enum_type_name;
  Printf.fprintf ml "~read:%s_of_value \n" enum_type_name;
  Printf.fprintf ml "~write:%s_to_value \n" enum_type_name;
  Printf.fprintf ml "%s\n" ctypes_typ

let get_values_and_variants info =
  let n = GIEnumInfo.get_n_values info in
  let rec get_v_and_v i v_v =
    if i == n then (List.rev v_v)
    else
      match GIEnumInfo.get_value info i with
      | None -> get_v_and_v (i + 1) v_v
      | Some value_info -> let value_base_info = GIValueInfo.to_baseinfo value_info in
        if GIBaseInfo.is_deprecated value_base_info then get_v_and_v (i + 1) v_v
        else match GIBaseInfo.get_name value_base_info with
          | None -> get_v_and_v (i + 1) v_v
          | Some const_name ->
            if BuilderUtils.has_number_at_beginning const_name then get_v_and_v (i + 1) v_v
            else let value = GIValueInfo.get_value value_info in
              let variant_name = String.capitalize_ascii const_name in
              get_v_and_v (i + 1) ((Int64.to_string value, variant_name) :: v_v)
  in get_v_and_v 0 []

let append_ctypes_enum_bindings enum_name info (mli, ml) =
  let enum_type_name = String.lowercase_ascii enum_name in
  let tag = GIEnumInfo.get_storage_type info in
  match BuilderUtils.type_tag_to_bindings_types tag with
  | Not_implemented tag_name -> Printf.fprintf mli "(* TODO enum %s : %s tag not implemented *)" enum_name tag_name;
    Printf.fprintf ml "(* TODO enum %s : %s tag not implemented *)" enum_name tag_name
  | Types {ocaml = ocaml_type; ctypes = ctypes_typ } ->
    let values_and_variants = get_values_and_variants info in
    append_enum_type enum_type_name values_and_variants mli;
    append_enum_type enum_type_name values_and_variants ml;
    append_enum_of_value_fn enum_name enum_type_name ocaml_type values_and_variants (mli, ml);
    append_enum_to_value_fn enum_name enum_type_name ocaml_type values_and_variants (mli, ml);
    append_enum_view enum_type_name ctypes_typ (mli, ml)

let append_flags_types enum_type_name values_and_variants descr =
  Printf.fprintf descr "type %s = " enum_type_name;
  Printf.fprintf descr "%s\n" (String.concat " | " (List.map (fun (_, v) -> v) values_and_variants));
  Printf.fprintf descr "type %s_list = %s list\n" enum_type_name enum_type_name

let append_flags_list_to_value_fn enum_name enum_type_name ocaml_type (mli, ml) =
  Printf.fprintf mli "val %s_list_to_value:\n%s_list -> %s\n" enum_type_name enum_type_name ocaml_type;
  let constant_type = if ocaml_type = "Unsigned.uint32" then "Unsigned.UInt32" else "Int32" in
  Printf.fprintf ml "let %s_list_to_value flags =\n\
                       let open %s in\n\
                       let rec logor_flags l acc =\n\
                         match l with\n\
                         | [] -> acc\n\
                         | f :: q -> let v = %s_to_value f in\n\
                         let acc' = logor acc v in\n\
                         logor_flags q acc'\n\
                       in\n\
                       logor_flags flags zero\n" enum_type_name constant_type enum_type_name

let append_flags_list_of_value_fn enum_name enum_type_name ocaml_type values_and_variants (mli, ml) =
  Printf.fprintf mli "val %s_list_of_value:\n%s -> %s_list\n" enum_type_name ocaml_type enum_type_name;
  let constant_type = if ocaml_type = "Unsigned.uint32" then "Unsigned.UInt32" else "Int32" in
  Printf.fprintf ml "let %s_list_of_value v =\n\
                     let open %s in\n" enum_type_name constant_type;
  Printf.fprintf ml "let all_flags = [%s]\n" (String.concat "; " (List.map (fun (x,v) ->
    String.concat " " ["("; negative_int_in_parentheses x; ","; v; ")"]) values_and_variants));
    Printf.fprintf ml "%s" "in\n\
                           let rec build_flags_list allf acc =\n\
                             match allf with\n\
                             | [] -> acc\n\
                             | (i, f) :: q -> if ((logand v (of_int i )) <> zero) then build_flags_list q (f :: acc)\n\
                             else build_flags_list q acc\n\
                           in build_flags_list all_flags []\n"
(* TODO: factorize, there is no need to rewrite each time build_flags_list. It
 * can be added once in core.ml of the lib. *)

let append_flags_view enum_type_name ctypes_typ (mli, ml) =
  Printf.fprintf mli "val %s_list : %s_list typ\n" enum_type_name enum_type_name;
  Printf.fprintf ml "let %s_list = view \n" enum_type_name;
  Printf.fprintf ml "~read:%s_list_of_value \n" enum_type_name;
  Printf.fprintf ml "~write:%s_list_to_value \n" enum_type_name;
  Printf.fprintf ml "%s\n" ctypes_typ

let append_ctypes_flags_bindings enum_name info (mli, ml) =
  let enum_type_name = String.lowercase_ascii enum_name in
  let tag = GIEnumInfo.get_storage_type info in
  match BuilderUtils.type_tag_to_bindings_types tag with
  | Not_implemented tag_name -> (
      Printf.fprintf mli "(* TODO flags %s : %s tag not implemented *)\n" enum_name tag_name;
      Printf.fprintf ml "(* TODO flags %s : %s tag not implemented *)\n" enum_name tag_name
    )
  | Types {ocaml = ocaml_type; ctypes = ctypes_typ } ->
    let values_and_variants = get_values_and_variants info in
    append_flags_types enum_type_name values_and_variants mli;
    append_flags_types enum_type_name values_and_variants ml;
    append_enum_of_value_fn enum_name enum_type_name ocaml_type values_and_variants (mli, ml);
    append_enum_to_value_fn enum_name enum_type_name ocaml_type values_and_variants (mli, ml);
    append_flags_list_of_value_fn enum_name enum_type_name ocaml_type values_and_variants (mli, ml);
    append_flags_list_to_value_fn enum_name enum_type_name ocaml_type (mli, ml);
    append_flags_view enum_type_name ctypes_typ (mli, ml)
