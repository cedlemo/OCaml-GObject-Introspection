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

open TestUtils
open OUnit2
open GObjectIntrospection

let repo = Repository.get_default ()

let get_union_info namespace union_name =
  match Repository.find_by_name repo namespace union_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Union -> let union_info = GIUnionInfo.from_baseinfo base_info in
      Some union_info
    | _ -> None

let union_test namespace union_name fn =
  match get_union_info namespace union_name with
  | None -> assert_equal_string union_name "No base info found"
  | Some (info) -> fn info

let test_writing_union namespace name writer mli_content ml_content =
  let _ = Repository.require repo namespace () in
  union_test namespace name (fun info ->
      let open Builder in
      let filename = String.concat "_" [namespace; name; "union"; "test"] in
      let tmp_files = Builder.generate_sources filename in
      let descrs = (tmp_files.mli.descr, tmp_files.ml.descr) in
      let _ = writer name info descrs in
      let _ = Builder.close_sources tmp_files in
      let _ = check_file_and_content tmp_files.mli.name mli_content in
      TestUtils.check_file_and_content tmp_files.ml.name ml_content
    )

let test_append_ctypes_union_declaration test_ctxt =
  let namespace = "GLib" in
  let name = "Mutex" in
  let writer = fun name info descrs ->
    BuilderUnion.append_ctypes_union_declaration name descrs in
  let mli_content = "type t\n\
                     val t_typ : t union typ" in
  let ml_content = "type t\n\
                    let t_typ : t union typ = union \"Mutex\"" in
  union_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
  )

let test_append_ctypes_union_fields_declarations test_ctxt =
  let namespace = "GLib" in
  let name = "Mutex" in
  let writer = BuilderUnion.append_ctypes_union_fields_declarations in
  let mli_content = "val f_p: (unit ptr, t union) field\n\
                     val f_i: (Array.t structure, t union) field" in
  let ml_content = "let f_p = field t_typ \"p\" (ptr void)\n\
                    let f_i = field t_typ \"i\" (Array.t_typ)" in
  union_test namespace name (fun info ->
      (* TODO : Implement BuilderUtils.type_info_to_bindings_types for C array
       * before re-enabling this.
       * test_writing test_ctxt info name writer mli_content ml_content *)
       ()
  )

let tests =
  "GObject Introspection BuilderUnion tests" >:::
  [
    "BuilderUnion append ctypes union declaration" >:: test_append_ctypes_union_declaration;
    "BuilderUnion append ctypes union fields declarations" >:: test_append_ctypes_union_fields_declarations
  ]
