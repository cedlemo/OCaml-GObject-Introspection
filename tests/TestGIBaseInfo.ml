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

let namespace = "Gio"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace
let info_name = "app_info_create_from_commandline"
let callback_name = "BusNameAppearedCallback"

let test_equal test_ctxt =
  match GIRepository.get_info repo namespace 10 with
  | None -> assert_equal true false
  | Some (rand_info) -> let info_name = GIBaseInfo.get_name rand_info in
  match GIRepository.find_by_name (Some repo) namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (info) -> let is_equal = GIBaseInfo.equal rand_info info in
  assert_equal_boolean true is_equal

let test_get_namespace test_ctxt =
  match GIRepository.find_by_name (Some repo) namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let info_namespace = GIBaseInfo.get_namespace base_info
  in assert_equal_string namespace info_namespace

(* TODO: fix error *)
let test_get_container test_ctxt =
  let info_name = "Button" in
  match GIRepository.find_by_name (Some repo) namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let container = GIBaseInfo.get_container base_info
  in let container_name = GIBaseInfo.get_name container in
  assert_equal_string "nope" container_name

let test_get_function_type test_ctxt =
  match GIRepository.find_by_name (Some repo) namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let info_type = GIBaseInfo.get_type base_info
  in assert_equal_string "function"  (GIBaseInfo.baseinfo_type_get_name info_type)

let test_get_callback_type test_ctxt =
  match GIRepository.find_by_name (Some repo) namespace callback_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let info_type = GIBaseInfo.get_type base_info
  in assert_equal_string "callback"  (GIBaseInfo.baseinfo_type_get_name info_type)

let tests =
  "GObject Introspection BaseInfo tests" >:::
    [
     "GIBaseInfo equal" >:: test_equal;
     "GIBaseInfo get namespace" >:: test_get_namespace;
     (*"GIBaseInfo get container" >:: test_get_container *)
     "GIBaseInfo get function type" >:: test_get_function_type;
     "GIBaseInfo get callback type" >:: test_get_callback_type
    ]
