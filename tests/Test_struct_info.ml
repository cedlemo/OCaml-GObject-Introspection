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

open Test_utils
open OUnit2
open GObject_introspection

let namespace = "GObject"
let repo = Repository.get_default ()
let typelib = Repository.require repo namespace ()
let struct_name = "Value"

let test_baseinfo_get_type test_ctxt =
  match Repository.find_by_name repo namespace struct_name with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (base_info) -> assert_equal_boolean true (
      match Base_info.get_type base_info with
      | Base_info.Struct -> true
      | _ -> false)

let get_struct_info () =
  match Repository.find_by_name repo namespace struct_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Struct -> Some (Struct_info.from_baseinfo base_info)
    | _ -> None

let struct_test fn =
  match get_struct_info () with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (info) -> fn info

let test_is_gtype_struct test_ctxt =
  struct_test (fun info ->
    let is_struct = Struct_info.is_gtype_struct info in
    assert_equal_boolean false is_struct
  )

let test_get_alignment test_ctxt =
  struct_test (fun info ->
    let alignment = Struct_info.get_alignment info in
    assert_equal_int 8 alignment
  )

let test_get_size test_ctxt =
  struct_test (fun info ->
    let size = Struct_info.get_size info in
    assert_equal_int 24 size
  )

let test_is_foreign test_ctxt =
  struct_test (fun info ->
    let is_struct = Struct_info.is_foreign info in
    assert_equal_boolean false is_struct
  )

let test_get_n_fields test_ctxt =
  struct_test (fun info ->
    let n_fields = Struct_info.get_n_fields info in
    assert_equal_int 2 n_fields
  )

let test_get_n_methods test_ctxt =
  struct_test (fun info ->
    let n_methods = Struct_info.get_n_methods info in
    assert_equal_or_greater n_methods 62
  )

let test_get_field test_ctxt =
  struct_test (fun info ->
      let field = Struct_info.get_field info 0 in
      let flags = Field_info.get_flags field in
      let rec check_flags = function
        | [] -> ()
        | f' :: q -> let _ = assert_equal ~printer:(fun f ->
            match f with
            | Field_info.Is_readable -> "readable"
            | Field_info.Is_writable -> "writable"
          ) Field_info.Is_readable f' in check_flags q
      in check_flags flags
    )

let test_get_field_out_of_bounds test_ctxt =
  struct_test (fun info ->
    try ignore(Struct_info.get_field info 300)
    with
    | Failure message -> assert_equal_string "Array Index out of bounds"
                                              message
    | _ -> assert_equal_string "Bad exception" "Not a Failure"
  )


let test_get_method test_ctxt =
  struct_test (fun info ->
    let m = Struct_info.get_method info 0 in
    let symbol = Function_info.get_symbol m in
    assert_equal_string "g_value_copy" symbol
  )

let test_get_method_out_of_bounds test_ctxt =
  struct_test (fun info ->
    try ignore(Struct_info.get_method info 300)
    with
    | Failure message -> assert_equal_string "Array Index out of bounds"
                                              message
    | _ -> assert_equal_string "Bad exception" "Not a Failure"
  )

let test_find_method test_ctxt =
  struct_test (fun info -> match Struct_info.find_method info "copy" with
    | None -> assert_equal_boolean false true
    | Some fn_info -> let symbol = Function_info.get_symbol fn_info in
      assert_equal_string "g_value_copy" symbol
  )

let test_find_method_bad_name test_ctxt =
  struct_test (fun info ->
    match Struct_info.find_method info "Impossible" with
    | None -> assert_equal_boolean true true
    | Some _ -> assert_equal_string "Impossible" "Should not returns something"
  )

let tests =
  "GObject Introspection StructInfo tests" >:::
  [
    "Struct_info from BaseInfo" >:: test_baseinfo_get_type;
    "Struct_info is gtype struct" >:: test_is_gtype_struct;
    "Struct_info get alignment" >:: test_get_alignment;
    "Struct_info get size" >:: test_get_size;
    "Struct_info is foreign" >:: test_is_foreign;
    "Struct_info get n fields" >:: test_get_n_fields;
    "Struct_info get n methods" >:: test_get_n_methods;
    "Struct_info get field" >:: test_get_field;
    "Struct_info get field out of bounds" >:: test_get_field_out_of_bounds;
    "Struct_info get method" >:: test_get_method;
    "Struct_info get method out of bounds" >:: test_get_method_out_of_bounds;
    "Struct_info find method" >:: test_find_method;
    "Struct_info find method bad name" >:: test_find_method_bad_name
  ]
