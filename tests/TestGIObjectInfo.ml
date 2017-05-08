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

let namespace = "Gdk"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace None 0 ()
let object_name = "Display"

let test_from_baseinfo test_ctxt =
  match GIRepository.find_by_name repo namespace object_name with
  | None -> assert_equal_string object_name "No base info found"
  | Some (base_info) -> assert_equal_boolean true (
      match GIBaseInfo.get_type base_info with
      | GIBaseInfo.Object -> true
      | _ -> false )

let get_object_info () =
  match GIRepository.find_by_name repo namespace object_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Object -> let object_info = GIObjectInfo.objectinfo_of_baseinfo base_info in
      Some object_info
    | _ -> None

let object_test fn =
  match get_object_info () with
  | None -> assert_equal_string object_name "No base info found"
  | Some (info) -> fn info

let test_get_abstract test_ctxt =
  object_test (fun info ->
      let is_abstract = GIObjectInfo.get_abstract info in
      assert_equal_boolean false is_abstract
    )

let test_get_fundamental test_ctxt =
  object_test (fun info ->
      let is_fundamental = GIObjectInfo.get_fundamental info in
      assert_equal_boolean false is_fundamental
    )

let test_get_parent test_ctxt =
  object_test (fun info ->
      let parent = GIObjectInfo.get_parent info in
      match GIBaseInfo.get_name parent with
      | None -> assert_equal_string "It should have " "a name"
      | Some parent_name -> assert_equal_string "Object" parent_name
    )

let test_get_type_name test_ctxt =
  object_test (fun info ->
      let type_name = GIObjectInfo.get_type_name info in
      assert_equal_string "GdkDisplay" type_name
    )

let test_get_type_init test_ctxt =
  object_test (fun info ->
      let type_init = GIObjectInfo.get_type_init info in
      assert_equal_string "gdk_display_get_type" type_init
    )

let test_get_n_constants test_ctxt =
  object_test (fun info ->
      let n = GIObjectInfo.get_n_constants info in
      assert_equal_int 0 n
    )

let test_get_n_fields test_ctxt =
  object_test (fun info ->
      let n = GIObjectInfo.get_n_fields info in
      assert_equal_int 0 n
    )

let test_get_n_interfaces test_ctxt =
  object_test (fun info ->
      let n = GIObjectInfo.get_n_interfaces info in
      assert_equal_int 0 n
    )

let test_get_n_methods test_ctxt =
  object_test (fun info ->
      let n = GIObjectInfo.get_n_methods info in
      assert_equal_int 48 n
    )

let tests =
  "GObject Introspection ObjectInfo tests" >:::
  [
    "GIObjectInfo from baseinfo" >:: test_from_baseinfo;
    "GIObjectInfo get abstract" >:: test_get_abstract;
    "GIObjectInfo get fundamental" >:: test_get_fundamental;
    "GIObjectInfo get parent" >:: test_get_parent;
    "GIObjectInfo get type name" >:: test_get_type_name;
    "GIObjectInfo get type init" >:: test_get_type_init;
    "GIObjectInfo get n constants" >:: test_get_n_constants;
    "GIObjectInfo get n fields" >:: test_get_n_fields;
    "GIObjectInfo get n interfaces" >:: test_get_n_interfaces;
    "GIObjectInfo get n methods" >:: test_get_n_methods
  ]
