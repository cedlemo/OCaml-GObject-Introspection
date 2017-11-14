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
let fn_name = "signal_list_ids"

let get_type_info () =
  match Repository.find_by_name repo namespace fn_name with
  | None -> assert_equal_string fn_name "No base info found"; None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Function ->
      let callable_info = Callable_info.from_baseinfo base_info in
      let type_info = Callable_info.get_return_type callable_info in
      Some type_info
    | _ -> None

let type_test fn =
  match get_type_info () with
  | None -> assert_equal_string fn_name "No base info found"
  | Some info -> fn info

let test_to_string test_ctxt =
  type_test (fun info ->
      let str = Type_info.to_string info in
      assert_equal_string "unknown" str
    )

let test_is_pointer test_ctxt =
  type_test (fun info ->
      let is_pointer = Type_info.is_pointer info in
      assert_equal_boolean true is_pointer
    )

let test_get_tag test_ctxt =
  type_test (fun info ->
      let tag = Type_info.get_tag info in
      assert_equal ~printer:(fun tag ->
          Types.string_of_tag tag
        ) Types.Array tag
    )

let test_get_array_length test_ctxt =
  type_test (fun info ->
      let length = Type_info.get_array_length info in
      assert_equal_int 1 length
    )

let test_get_array_fixed_size test_ctxt =
  type_test (fun info ->
      let size = Type_info.get_array_fixed_size info in
      assert_equal_int (-1) size
    )

let test_is_zero_terminated test_ctxt =
  type_test (fun info ->
      let zero_terminated = Type_info.is_zero_terminated info in
      assert_equal_boolean false zero_terminated
    )

let test_get_array_type test_ctxt =
  type_test (fun info ->
      match Type_info.get_array_type info with
      | None -> assert_equal_string "It should " "be an array"
      | Some array_type -> assert_equal ~printer:(fun t ->
          Types.string_of_array_type t)
          Types.C array_type
    )

let test_get_param_type test_ctxt =
  type_test (fun info ->
     let param_type = Type_info.get_param_type info 0 in
     let tag = Type_info.get_tag param_type in
      assert_equal ~printer:(fun tag ->
          Types.string_of_tag tag
        ) Types.Uint32 tag
    )

let test_get_interface_none test_ctxt =
type_test (fun info ->
      match Type_info.get_interface info with
      | None -> assert_equal true true
      | _ -> assert_equal_string "This type info " "should not have interface"
    )

let test_get_interface test_ctxt =
  let name = "type_class_ref" in
  match Repository.find_by_name repo namespace name with
  | None -> assert_equal_string fn_name "No base info found"
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Function ->
      (
        let callable_info = Callable_info.from_baseinfo base_info in
        let type_info = Callable_info.get_return_type callable_info in
        match Type_info.get_interface type_info with
        | None -> assert_equal_string "It should " "have an interface"
        | Some interface -> match Base_info.get_name interface with
          | None -> assert_equal_string "It should " "have a name"
          | Some interface_name -> assert_equal_string "TypeClass" interface_name
      )
    | _ -> assert_equal_string name "should be function type"

let tests =
  "GObject Introspection TypeInfo tests" >:::
  [
    "Type_info to string" >:: test_to_string;
    "Type_info is pointer" >:: test_is_pointer;
    "Type_info get tag" >:: test_get_tag;
    "Type_info get array length" >:: test_get_array_length;
    "Type_info get array fixed size" >:: test_get_array_fixed_size;
    "Type_info get is zero terminated" >:: test_is_zero_terminated;
    "Type_info get array type" >:: test_get_array_type;
    "Type_info get param type" >:: test_get_param_type;
    "Type_info get interface none" >:: test_get_interface_none;
    "Type_info get interface" >:: test_get_interface
  ]