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

let namespace = "GObject"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace
let struct_name = "Value"

let test_gistructinfo_from_baseinfo test_ctxt =
  match GIRepository.find_by_name (Some repo) namespace struct_name with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (base_info) -> assert_equal_boolean true (
      match GIBaseInfo.get_type base_info with
      | GIBaseInfo.Struct struct_info -> true
      | _ -> false)

let get_struct_info () =
  match GIRepository.find_by_name (Some repo) namespace struct_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Struct struct_info -> Some struct_info
    | _ -> None

let test_gistructinfo_get_alignment test_ctxt =
  match get_struct_info () with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (info) ->let alignment = GIStructInfo.get_alignment info in
      assert_equal_int 8 alignment

let test_gistructinfo_get_size test_ctxt =
  match get_struct_info () with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (info) ->let size = GIStructInfo.get_size info in
      assert_equal_int 24 size

let test_gistructinfo_is_gtype_struct test_ctxt =
  match get_struct_info () with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (info) -> let is_struct = GIStructInfo.is_gtype_struct info in
    assert_equal_boolean false is_struct

let test_gistructinfo_is_foreign test_ctxt =
  match get_struct_info () with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (info) -> let is_struct = GIStructInfo.is_foreign info in
    assert_equal_boolean false is_struct

let tests =
  "GObject Introspection StructInfo tests" >:::
  [
    "GIStructInfo from baseinfo" >:: test_gistructinfo_from_baseinfo;
    "GIStructInfo get alignment" >:: test_gistructinfo_get_alignment;
    "GIStructInfo get size" >:: test_gistructinfo_get_size;
    "GIStructInfo is gtype struct" >:: test_gistructinfo_is_gtype_struct;
    "GIStructInfo is foreign" >:: test_gistructinfo_is_foreign
  ]
