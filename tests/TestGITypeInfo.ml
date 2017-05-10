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
let typelib = GIRepository.require repo namespace None 0 ()
let fn_name = "signal_list_ids"

let get_type_info () =
  match GIRepository.find_by_name repo namespace fn_name with
  | None -> assert_equal_string fn_name "No base info found"; None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function ->
      let callable_info = GICallableInfo.from_baseinfo base_info in
      let type_info = GICallableInfo.get_return_type callable_info in
      Some type_info
    | _ -> None

let type_test fn =
  match get_type_info () with
  | None -> assert_equal_string fn_name "No base info found"
  | Some info -> fn info

let test_to_string test_ctxt =
  type_test (fun info ->
      let str = GITypeInfo.to_string info in
      assert_equal_string "unknown" str
    )

let test_is_pointer test_ctxt =
  type_test (fun info ->
      let is_pointer = GITypeInfo.is_pointer info in
      assert_equal_boolean true is_pointer
    )

let test_get_tag test_ctxt =
  type_test (fun info ->
      let tag = GITypeInfo.get_tag info in
      assert_equal ~printer:(fun tag ->
          GITypes.string_of_tag tag
        ) GITypes.Array tag
    )

let test_get_array_length test_ctxt =
  type_test (fun info ->
      let length = GITypeInfo.get_array_length info in
      assert_equal_int 1 length
    )

let test_get_array_fixed_size test_ctxt =
  type_test (fun info ->
      let size = GITypeInfo.get_array_fixed_size info in
      assert_equal_int (-1) size
    )

let test_is_zero_terminated test_ctxt =
  type_test (fun info ->
      let zero_terminated = GITypeInfo.is_zero_terminated info in
      assert_equal_boolean false zero_terminated
    )

let test_get_array_type test_ctxt =
  type_test (fun info ->
      match GITypeInfo.get_array_type info with
      | None -> assert_equal_string "It should " "be an array"
      | Some array_type -> assert_equal ~printer:(fun t ->
          GITypes.string_of_array_type t)
          GITypes.C array_type
    )

let test_get_param_type test_ctxt =
  type_test (fun info ->
     let param_type = GITypeInfo.get_param_type info 0 in
     let tag = GITypeInfo.get_tag param_type in
      assert_equal ~printer:(fun tag ->
          GITypes.string_of_tag tag
        ) GITypes.Uint32 tag
    )

let test_get_interface_none test_ctxt =
type_test (fun info ->
      match GITypeInfo.get_interface info with
      | None -> assert_equal true true
      | _ -> assert_equal_string "This type info " "should not have interface"
    )

let test_get_interface test_ctxt =
  let name = "type_class_ref" in
  match GIRepository.find_by_name repo namespace name with
  | None -> assert_equal_string fn_name "No base info found"
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function ->
      (
        let callable_info = GICallableInfo.from_baseinfo base_info in
        let type_info = GICallableInfo.get_return_type callable_info in
        match GITypeInfo.get_interface type_info with
        | None -> assert_equal_string "It should " "have an interface"
        | Some interface -> match GIBaseInfo.get_name interface with
          | None -> assert_equal_string "It should " "have a name"
          | Some interface_name -> assert_equal_string "TypeClass" interface_name
      )
    | _ -> assert_equal_string name "should be function type"

let tests =
  "GObject Introspection TypeInfo tests" >:::
  [
    "GITypeInfo to string" >:: test_to_string;
    "GITypeInfo is pointer" >:: test_is_pointer;
    "GITypeInfo get tag" >:: test_get_tag;
    "GITypeInfo get array length" >:: test_get_array_length;
    "GITypeInfo get array fixed size" >:: test_get_array_fixed_size;
    "GITypeInfo get is zero terminated" >:: test_is_zero_terminated;
    "GITypeInfo get array type" >:: test_get_array_type;
    "GITypeInfo get param type" >:: test_get_param_type;
    "GITypeInfo get interface none" >:: test_get_interface_none;
    "GITypeInfo get interface" >:: test_get_interface
  ]
