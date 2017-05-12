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
let typelib = GIRepository.require repo namespace None 0 ()
let interface_name = "TlsServerConnection"

let get_interface_info () =
  match GIRepository.find_by_name repo namespace interface_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Interface ->
      let interface_info = GIInterfaceInfo.from_baseinfo base_info in
      Some interface_info
    | _ -> None

let interface_test fn =
  match get_interface_info () with
  | None -> assert_equal_string interface_name "No base info found"
  | Some (info) -> fn info

let test_get_n_prerequisites test_ctxt =
  interface_test (fun info ->
      let n = GIInterfaceInfo.get_n_prerequisites info in
      assert_equal_int 1 n
    )

let test_get_prerequisite test_ctxt =
  interface_test (fun info ->
      let info' = GIInterfaceInfo.get_prerequisite info 0 in
      match GIBaseInfo.get_name info' with
      | None -> assert_equal_string "It should have " " a name"
      | Some name -> assert_equal_string "TlsConnection" name
    )

let test_get_n_properties test_ctxt =
  interface_test (fun info ->
      let n = GIInterfaceInfo.get_n_properties info in
      assert_equal_int 1 n
    )

let test_get_property test_ctxt =
interface_test (fun info ->
      let info' = GIInterfaceInfo.get_property info 0 in
      let base_info = GIPropertyInfo.to_baseinfo info' in
      match GIBaseInfo.get_name base_info with
      | None -> assert_equal_string "It should have " " a name"
      | Some name -> assert_equal_string "authentication-mode" name
    )

let test_get_n_methods test_ctxt =
  interface_test (fun info ->
      let n = GIInterfaceInfo.get_n_methods info in
      assert_equal_int 1 n
    )

let tests =
  "GObject Introspection InterfaceInfo tests" >:::
  [
    "GIInterfaceInfo get n prerequisites" >:: test_get_n_prerequisites;
    "GIInterfaceInfo get prerequisiste" >:: test_get_prerequisite;
    "GIInterfaceInfo get n properties" >:: test_get_n_properties;
    "GIInterfaceInfo get property" >:: test_get_property;
    "GIInterfaceInfo get n methods" >:: test_get_n_methods
  ]
