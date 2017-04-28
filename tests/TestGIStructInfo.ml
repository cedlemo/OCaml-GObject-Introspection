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

let test_baseinfo_get_type test_ctxt =
  match GIRepository.find_by_name repo namespace struct_name with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (base_info) -> assert_equal_boolean true (
      match GIBaseInfo.get_type base_info with
      | GIBaseInfo.Struct -> true
      | _ -> false)

let get_struct_info () =
  match GIRepository.find_by_name repo namespace struct_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Struct -> Some (GIStructInfo.structinfo_of_baseinfo base_info)
    | _ -> None

let struct_test fn =
  match get_struct_info () with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (info) -> fn info

let test_is_gtype_struct test_ctxt =
  struct_test (fun info ->
    let is_struct = GIStructInfo.is_gtype_struct info in
    assert_equal_boolean false is_struct
  )

let test_get_alignment test_ctxt =
  struct_test (fun info ->
    let alignment = GIStructInfo.get_alignment info in
    assert_equal_int 8 alignment
  )

let test_get_size test_ctxt =
  struct_test (fun info ->
    let size = GIStructInfo.get_size info in
    assert_equal_int 24 size
  )

let test_is_foreign test_ctxt =
  struct_test (fun info ->
    let is_struct = GIStructInfo.is_foreign info in
    assert_equal_boolean false is_struct
  )

let test_get_n_fields test_ctxt =
  struct_test (fun info ->
    let n_fields = GIStructInfo.get_n_fields info in
    assert_equal_int 2 n_fields
  )

let test_get_n_methods test_ctxt =
  struct_test (fun info ->
    let n_methods = GIStructInfo.get_n_methods info in
    assert_equal_or_greater n_methods 62
  )

let test_get_field test_ctxt =
  struct_test (fun info ->
      let field = GIStructInfo.get_field info 0 in
      let flags = GIFieldInfo.get_flags field in
      let rec check_flags = function
        | [] -> ()
        | f' :: q -> let _ = assert_equal ~printer:(fun f ->
            match f with
            | GIFieldInfo.Is_readable -> "readable"
            | GIFieldInfo.Is_writable -> "writable"
          ) GIFieldInfo.Is_readable f' in check_flags q
      in check_flags flags
    )

let test_get_method test_ctxt =
  struct_test (fun info ->
    let m = GIStructInfo.get_method info 0 in
    let symbol = GIFunctionInfo.get_symbol m in
    assert_equal_string "g_value_copy" symbol
  )

let tests =
  "GObject Introspection StructInfo tests" >:::
  [
    "GIStructInfo from BaseInfo" >:: test_baseinfo_get_type;
    "GIStructInfo is gtype struct" >:: test_is_gtype_struct;
    "GIStructInfo get alignment" >:: test_get_alignment;
    "GIStructInfo get size" >:: test_get_size;
    "GIStructInfo is foreign" >:: test_is_foreign;
    "GIStructInfo get n fields" >:: test_get_n_fields;
    "GIStructInfo get n methods" >:: test_get_n_methods;
    "GIStructInfo get field" >:: test_get_field;
    "GIStructInfo get method" >:: test_get_method
  ]
