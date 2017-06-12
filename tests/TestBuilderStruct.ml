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

let repo = GIRepository.get_default ()

let get_struct_info namespace struct_name =
  match GIRepository.find_by_name repo namespace struct_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Struct -> let struct_info = GIStructInfo.from_baseinfo base_info in
      Some struct_info
    | _ -> None

let struct_test namespace struct_name fn =
  match get_struct_info namespace struct_name with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (info) -> fn info

let test_append_ctypes_struct_declaration test_ctxt =
  let namespace = "GLib" in
  let name = "Array" in
  let writer = fun name info descrs ->
    BuilderStruct.append_ctypes_struct_declaration name descrs in
  let mli_content = "type t\n\
                     val array : t structure typ" in
  let ml_content = "type t\n\
                    let array : t structure typ = structure \"Array\"" in
  struct_test namespace name (fun info ->
    test_writing test_ctxt info namespace name writer mli_content ml_content
    )

let test_append_ctypes_struct_fields_declarations test_ctxt =
  let namespace = "GLib" in
  let name = "SList" in
  let writer = BuilderStruct.append_ctypes_struct_fields_declarations in
  let mli_content = "val data: (unit ptr, t structure) field\n\
                     val next: (SList.t structure ptr, t structure) field" in
  let ml_content = "let data = field slist \"data\" (ptr void)\n\
                    let next = field slist \"next\" (ptr SList.slist)\n\
                    let _ = seal slist" in
  struct_test namespace name (fun info ->
      test_writing test_ctxt info namespace name writer mli_content ml_content
  )

let tests =
  "GObject Introspection BuilderStruct tests" >:::
  [
    "BuilderStruct append ctypes struct declaration" >:: test_append_ctypes_struct_declaration;
    "BuilderStruct append ctypes struct fields declarations" >:: test_append_ctypes_struct_fields_declarations
  ]
