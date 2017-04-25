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

open OUnit2
open TestUtils

let test_get_default test_ctxt =
  let _ = GIRepository.get_default () in
  assert_equal_boolean true true

let test_require test_ctxt =
  let repo = GIRepository.get_default () in
  let namespace = Some "Gio" in
  let _ = GIRepository.require repo namespace None 0 () in
  assert_equal_boolean true true

let namespace = Some "Gio"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace None 0 ()

let test_get_loaded_namespaces test_ctxt =
  let namespaces_check = "GLib GObject Gio" in
  let namespaces = String.concat " " (GIRepository.get_loaded_namespaces repo) in
  assert_equal_string namespaces_check namespaces

let test_get_dependencies test_ctxt =
  let dependencies_check = "GLib-2.0 GObject-2.0" in
  let dependencies = String.concat " " (GIRepository.get_dependencies repo namespace) in
  assert_equal_string dependencies_check dependencies

let test_get_c_prefix test_ctxt =
  let c_prefix = GIRepository.get_c_prefix repo namespace in
  assert_equal_string "G" c_prefix

let test_get_version test_ctxt =
  let version = GIRepository.get_version repo namespace in
  assert_equal_string "2.0" version

let test_get_typelib_path text_ctxt =
  let path = GIRepository.get_typelib_path repo namespace in
  assert_equal_string "/usr/lib/girepository-1.0/Gio-2.0.typelib" path

let test_enumerate_versions test_ctxt =
  (* TODO : fix -> should be "3.0 2.0" *)
  let versions_check = "2.0 2.0" in
  let versions = String.concat " " (GIRepository.enumerate_versions repo namespace) in
  assert_equal_string versions_check versions

let test_get_search_path test_ctxt =
  let path = String.concat " " (GIRepository.get_search_path ()) in
  assert_equal_string "/usr/lib/girepository-1.0" path

let test_prepend_search_path test_ctxt =
  let initial_path = String.concat " " (GIRepository.get_search_path ()) in
  let new_path = "/home/myhome" in
  let _ = GIRepository.prepend_search_path new_path in
  let paths = String.concat " " (GIRepository.get_search_path ()) in
  let initial_paths = String.concat " " [new_path; initial_path] in
  assert_equal_string initial_paths paths

let test_find_by_name test_ctxt =
  let info_name = "Application" in
  let namespace = "Gio" in
  match GIRepository.find_by_name repo namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> match GIBaseInfo.get_name base_info with
    | None -> assert_equal_string info_name "No name found"
    | Some name -> assert_equal_string info_name name

let tests =
  "GObject Introspection Repository tests" >:::
    [
      "GIRepository get default" >:: test_get_default;
      "GIRepository require" >:: test_require;
      (* Disable for compatibility with Travis
       * "GIRepository get dependencies" >:: test_get_dependencies; *)
      "GIRepository get loaded namespaces" >:: test_get_loaded_namespaces;
      "GIRepository get c prefix" >:: test_get_c_prefix;
      "GIRepository get version" >:: test_get_version;
      "GIRepository get typelib path" >:: test_get_typelib_path;
      "GIRepository enumerate versions" >:: test_enumerate_versions;
      "GIRepository get search path" >:: test_get_search_path;
      "GIRepository prepend search path" >:: test_prepend_search_path;
      "GIRepository find by name" >:: test_find_by_name
    ]
