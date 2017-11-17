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

let append_enum_type values_and_variants file =
  String.concat " | " (List.map (fun (_, v) -> v) values_and_variants)
  |> Binding_utils.File.bprintf file "type t = %s\n"

let negative_int_in_parentheses value =
  if (String.get value 0 = '-') then String.concat " " ["("; value; ")"]
  else value

let value_info_to_enum_type_conversion ocaml_type value =
  if ocaml_type = "Unsigned.uint32" then "Unsigned.UInt32.of_int " ^ value
  else if (String.get value 0 = '-') then String.concat "" ["Int32.of_int "; "("; value; ")"]
  else  "Int32.of_int " ^ value

let append_enum_of_value_fn enum_name ocaml_type values_and_variants sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  File.bprintf mli "val of_value:\n%s -> t\n" ocaml_type;
  File.buff_add ml "let of_value v =\nif v = ";
  File.buff_add ml (String.concat "else if v = " (List.map (fun (x, v) ->
      String.concat "" [value_info_to_enum_type_conversion ocaml_type x; " then "; v; "\n"] ) values_and_variants));
  File.bprintf ml "else raise (Invalid_argument \"Unexpected %s value\")\n" enum_name

let append_enum_to_value_fn enum_name ocaml_type values_and_variants sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  File.bprintf mli "val to_value:\nt -> %s\n" ocaml_type;
  File.bprintf ml "let to_value = function\n| %s" (String.concat "| " (List.map (fun (x, v) ->
      String.concat "" [v; " -> "; value_info_to_enum_type_conversion ocaml_type x; "\n"] ) values_and_variants))

let append_enum_view ctypes_typ sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  File.buff_add_line mli "val t_view: t typ";
  File.buff_add_line ml "let t_view = view";
  File.buff_add_line ml "~read:of_value";
  File.buff_add_line ml "~write:to_value";
  File.buff_add_line ml ctypes_typ

let get_values_and_variants info =
  let n = Enum_info.get_n_values info in
  let rec get_v_and_v i v_v =
    if i == n then (List.rev v_v)
    else
      match Enum_info.get_value info i with
      | None -> get_v_and_v (i + 1) v_v
      | Some value_info -> let value_base_info = Value_info.to_baseinfo value_info in
        if Base_info.is_deprecated value_base_info then get_v_and_v (i + 1) v_v
        else match Base_info.get_name value_base_info with
          | None -> get_v_and_v (i + 1) v_v
          | Some const_name ->
            if Binding_utils.has_number_at_beginning const_name then get_v_and_v (i + 1) v_v
            else let value = Value_info.get_value value_info in
              let variant_name = String.capitalize_ascii const_name in
              get_v_and_v (i + 1) ((Int64.to_string value, variant_name) :: v_v)
  in get_v_and_v 0 []

let append_ctypes_enum_bindings enum_name info sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  let tag = Enum_info.get_storage_type info in
  match type_tag_to_bindings_types tag with
  | Not_implemented tag_name ->
      let coms = Printf.sprintf "TODO enum %s : %s tag not implemented" enum_name tag_name in
      Sources.buffs_add_comments sources coms
  | Types {ocaml = ocaml_type; ctypes = ctypes_typ } ->
    let values_and_variants = get_values_and_variants info in
    append_enum_type values_and_variants mli;
    append_enum_type values_and_variants ml;
    append_enum_of_value_fn enum_name ocaml_type values_and_variants sources;
    append_enum_to_value_fn enum_name ocaml_type values_and_variants sources;
    append_enum_view ctypes_typ sources;
    Sources.buffs_add_eol sources

let append_flags_types values_and_variants file =
  let open Binding_utils in
  String.concat " | " (List.map (fun (_, v) -> v) values_and_variants)
  |> File.bprintf file "type t = %s\n";
  File.buff_add_line file "type t_list = t list"

let append_flags_list_to_value_fn enum_name ocaml_type sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  File.bprintf mli "val list_to_value:\nt_list -> %s\n" ocaml_type;
  let constant_type = if ocaml_type = "Unsigned.uint32" then "Unsigned.UInt32" else "Int32" in
  File.bprintf ml "let list_to_value flags =\n\
                   let open %s in\n\
                   let rec logor_flags l acc =\n\
                       match l with\n\
                       | [] -> acc\n\
                       | f :: q -> let v = to_value f in\n\
                       let acc' = logor acc v in\n\
                       logor_flags q acc'\n\
                     in\n\
                     logor_flags flags zero\n" constant_type

let append_flags_list_of_value_fn enum_name ocaml_type values_and_variants sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  File.bprintf mli "val list_of_value:\n%s -> t_list\n" ocaml_type;
  let constant_type = if ocaml_type = "Unsigned.uint32" then "Unsigned.UInt32" else "Int32" in
  File.bprintf ml "let list_of_value v =\nlet open %s in\n" constant_type;
  File.bprintf ml "let all_flags = [%s]\n" (String.concat "; " (List.map (fun (x,v) ->
    String.concat " " ["("; negative_int_in_parentheses x; ","; v; ")"]) values_and_variants));
    File.bprintf ml "in\n\
                           let rec build_flags_list allf acc =\n\
                             match allf with\n\
                             | [] -> acc\n\
                             | (i, f) :: q -> if ((logand v (of_int i )) <> zero) then build_flags_list q (f :: acc)\n\
                             else build_flags_list q acc\n\
                           in build_flags_list all_flags []\n%!"
(* TODO: factorize, there is no need to rewrite each time build_flags_list. It
 * can be added once in core.ml of the lib. *)

let append_flags_view ctypes_typ sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  File.buff_add_line mli "val t_list_view : t_list typ";
  File.buff_add_line ml "let t_list_view = view";
  File.buff_add_line ml "~read:list_of_value";
  File.buff_add_line ml "~write:list_to_value";
  File.buff_add_line ml ctypes_typ

let append_ctypes_flags_bindings enum_name info sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in  let tag = Enum_info.get_storage_type info in
  match Binding_utils.type_tag_to_bindings_types tag with
  | Not_implemented tag_name ->
      let coms = Printf.sprintf "TODO flags %s : %s tag not implemented *)\n" enum_name tag_name in
      Sources.buffs_add_comments sources coms
  | Types {ocaml = ocaml_type; ctypes = ctypes_typ } ->
    let values_and_variants = get_values_and_variants info in
    append_flags_types values_and_variants mli;
    append_flags_types values_and_variants ml;
    append_enum_of_value_fn enum_name ocaml_type values_and_variants sources;
    append_enum_to_value_fn enum_name ocaml_type values_and_variants sources;
    append_flags_list_of_value_fn enum_name ocaml_type values_and_variants sources;
    append_flags_list_to_value_fn enum_name ocaml_type sources;
    append_flags_view ctypes_typ sources;
    Sources.buffs_add_eol sources

let parse_enum_info info sources =
  match Binding_utils.get_binding_name info with
  | None -> ()
  | Some name -> let info' = Enum_info.from_baseinfo info in
    append_ctypes_enum_bindings name info' sources;
    Binding_utils.Sources.write_buffs sources

let parse_flags_info info sources =
  match Binding_utils.get_binding_name info with
  | None -> ()
  | Some name -> let info' = Enum_info.from_baseinfo info in
    append_ctypes_flags_bindings name info' sources;
    Binding_utils.Sources.write_buffs sources
