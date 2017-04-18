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

let namespace = "Gio"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require (Some repo) namespace

let test_raises_failure_on_require test_ctxt =
  let r () = load_namespace "a namespace that does not exist" in
  let error_message = "Typelib file for namespace 'a namespace that does not exist' (any version) not found" in
  assert_raises (Failure error_message ) r

let test_load_namespace test_ctxt =
  let c_prefix = GIRepository.get_c_prefix (Some repo) namespace in
  assert_equal_string "G" c_prefix

let test_search_path test_ctxt =
  let initial_search_path = (String.concat " " (GIRepository.get_search_path ())) in
  let with_search_path= "/home/cedlemo" in
  let _ = GIRepository.prepend_search_path with_search_path in
  let search_path = String.concat " " (GIRepository.get_search_path ()) in
  assert_equal_string (String.concat " " [initial_search_path; with_search_path])
                      search_path

let test_get_dependencies test_ctxt =
  let dependencies_check = "GObject-2.0 GLib-2.0" in
  let dependencies = String.concat " " (GIRepository.get_dependencies (Some repo) namespace) in
  assert_equal_string dependencies_check dependencies

(* Commented out because of GI Travis v. 1.40 and this function need v >= 1.44
let test_get_immediate_dependencies test_ctxt =
  let dependencies_check = "GObject-2.0" in
  let dependencies = String.concat " " (GIRepository.get_immediate_dependencies repo namespace) in
  assert_equal_string dependencies_check dependencies
*)

let test_get_loaded_namespaces test_ctxt =
  let namespaces_check = "Gio GObject GLib" in
  let namespaces = String.concat " " (GIRepository.get_loaded_namespaces (Some repo)) in
  assert_equal_string namespaces_check namespaces

let test_get_loaded_versions test_ctxt =
  let versions_check = "3.0 2.0" in
  let versions = String.concat " " (GIRepository.enumerate_versions None namespace) in
  assert_equal_string versions_check versions

let test_find_by_name test_ctxt =
  let info_name = "Application" in
  match GIRepository.find_by_name (Some repo) namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let base_info_name = GIBaseInfo.get_name base_info
  in assert_equal_string info_name base_info_name

let test_find_by_name_repo_none test_ctxt =
  let info_name = "Application" in
  match GIRepository.find_by_name None namespace info_name with
  | None -> assert_equal_string info_name "No base info found"
  | Some (base_info) -> let base_info_name = GIBaseInfo.get_name base_info
  in assert_equal_string info_name base_info_name

let test_n_infos test_ctxt =
  let n_infos = GIRepository.get_n_infos (Some repo) namespace in
  assert_equal_int 175 n_infos


let tests =
  "GObject Introspection Repository tests" >:::
    ["Test failure when loading bad namespace" >:: test_raises_failure_on_require;
     "Load Gtk namespace" >:: test_load_namespace;
     "Search path tests" >:: test_search_path;
     (* "GLib dependencies tests" >:: test_get_dependencies; *)
     (* "Gtk immediate dependencies tests" >:: test_get_immediate_dependencies; *)
     "GLib get loaded namespaces tests" >:: test_get_loaded_namespaces;
     "GIRepository find GIBaseInfo by name" >:: test_find_by_name;
     "GIRepository find GIBaseInfo by name repo none" >:: test_find_by_name_repo_none (* ;
      TODO : why 175 is not equal to  175 ?????
     "GIRepository get n infos" >:: test_n_infos *)
    ]
