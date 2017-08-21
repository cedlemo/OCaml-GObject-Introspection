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

let namespace = "GLib"
let repo = Repository.get_default ()
let typelib = Repository.require repo namespace ()
let union_name = "Mutex"

let test_from_baseinfo test_ctxt =
  match Repository.find_by_name repo namespace union_name with
  | None -> assert_equal_string union_name "No base info found"
  | Some (base_info) -> assert_equal_boolean true (
      match Base_info.get_type base_info with
      | Base_info.Union -> true
      | _ -> false )

let get_union_info () =
  match Repository.find_by_name repo namespace union_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Union -> let union_info = GIUnionInfo.from_baseinfo base_info in
      Some union_info
    | _ -> None

let union_test fn =
  match get_union_info () with
  | None -> assert_equal_string union_name "No base info found"
  | Some (info) -> fn info

let test_get_n_fields test_ctxt =
  union_test (fun info ->
    let n = GIUnionInfo.get_n_fields info in
    assert_equal_int 2 n
  )

let test_get_size test_ctxt =
  union_test (fun info ->
    let size = GIUnionInfo.get_size info in
    assert_equal_int 8 size
  )

let test_get_alignment test_ctxt =
  union_test (fun info ->
    let alignment = GIUnionInfo.get_alignment info in
    assert_equal_int 8 alignment
  )

let test_get_n_methods test_ctxt =
  union_test (fun info ->
    let n = GIUnionInfo.get_n_methods info in
    assert_equal_int 5 n
  )

let test_get_field test_ctxt =
  union_test (fun info ->
    let field = GIUnionInfo.get_field info 0 in
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
  union_test (fun info ->
    try ignore(GIUnionInfo.get_field info 3000)
    with
    | Failure message -> assert_equal_string "Array Index out of bounds"
                                              message
    | _ -> assert_equal_string "Bad exception" "Not a Failure"
  )

let test_get_method test_ctxt =
  union_test (fun info ->
    let m = GIUnionInfo.get_method info 0 in
    let symbol = Function_info.get_symbol m in
    assert_equal_string "g_mutex_clear" symbol
  )

let test_get_method_out_of_bounds test_ctxt =
  union_test (fun info ->
    try ignore(GIUnionInfo.get_method info 300)
    with
    | Failure message -> assert_equal_string "Array Index out of bounds"
                                              message
    | _ -> assert_equal_string "Bad exception" "Not a Failure"
  )

let test_find_method test_ctxt =
  let function_name = "clear" in
  union_test (fun info ->
      match GIUnionInfo.find_method info function_name with
      | None -> assert_equal_boolean true false
      | Some m -> let symbol = Function_info.get_symbol m in
        assert_equal_string ("g_mutex_" ^ function_name) symbol
    )

let test_is_discriminated test_ctxt =
  union_test (fun info ->
      let is_discriminated = GIUnionInfo.is_discriminated info in
      assert_equal_boolean false is_discriminated
  )

let tests =
  "GObject Introspection UnionInfo tests" >:::
  [
    "GIUnionInfo from baseinfo" >:: test_from_baseinfo;
    "GIUnionInfo get n fields" >:: test_get_n_fields;
    "GIUnionInfo get size" >:: test_get_size;
    "GIUnionInfo get alignment" >:: test_get_alignment;
    "GIUnionInfo get n methods" >:: test_get_n_methods;
    "GIUnionInfo get field" >:: test_get_field;
    "GIUnionInfo get field out of bounds" >:: test_get_field_out_of_bounds;
    "GIUnionInfo get method" >:: test_get_method;
    "GIUnionInfo get method out of bounds" >:: test_get_method_out_of_bounds;
    "GIUnionInfo find method" >:: test_find_method;
    "GIUnionInfo is discriminated" >:: test_is_discriminated
  ]
