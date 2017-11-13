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

let append_ctypes_union_declaration name sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  File.buff_add_line mli "type t";
  File.buff_add_line mli "val t_typ : t union typ";
  File.buff_add_line ml "type t";
  File.bprintf ml "let t_typ : t union typ = union \"%s\"\n" name

let append_ctypes_union_fields_declarations union_name info sources skip_types =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  let append_ctypes_union_field_declarations field_info =
    let base_info = Field_info.to_baseinfo field_info in
    match Base_info.get_name base_info with
    | None -> false
    | Some name ->
      let type_info = Field_info.get_type field_info in
      match Binding_utils.type_info_to_bindings_types type_info false with
      | Not_implemented tag_name ->
        let coms = Printf.sprintf "TODO Union field %s : %s tag not implemented" union_name tag_name in
        Sources.buffs_add_comments sources coms;
        false
      | Types {ocaml = ocaml_type; ctypes = ctypes_typ } ->
        if Binding_utils.match_one_of ocaml_type skip_types then
          let com = Printf.sprintf "field type %s" ocaml_type in
          let _ = Sources.buffs_add_skipped sources com in
          false
        else
          let _ = File.bprintf mli "val f_%s: (%s, t union) field\n" name ocaml_type in
          let _ = File.bprintf ml "let f_%s = field t_typ \"%s\" (%s)\n" name name ctypes_typ in
          true
  in
  let n = Union_info.get_n_fields info in
  let rec iterate_over_field index n_implemented =
    if index = n then n_implemented
    else (
      let field_info = Union_info.get_field info index in
      if append_ctypes_union_field_declarations field_info then
        iterate_over_field (index + 1) (n_implemented + 1)
      else
        iterate_over_field (index + 1) n_implemented
    )
  in
  if iterate_over_field 0 0 > 0 then File.buff_add_line ml "let _ = seal t_typ"
(*  let n = Union_info.get_n_fields info in
  for i = 0 to n - 1 do
    let field_info = Union_info.get_field info i in
    append_ctypes_union_field_declarations field_info
  done *)

let append_ctypes_union_seal file =
  Binding_utils.File.buff_add_line file "let _ = seal t_typ"

let parse_union_info info sources skip =
  let open Binding_utils in
  match get_binding_name info with
  | None -> ()
  | Some name ->
    let info' = Union_info.from_baseinfo info in
    append_ctypes_union_declaration name sources;
    append_ctypes_union_fields_declarations name info' sources skip;
    let mli = Sources.mli sources in
    let ml = Sources.ml sources in
    File.buff_add_eol mli;
    File.buff_add_eol ml;
    Sources.write_buffs sources
