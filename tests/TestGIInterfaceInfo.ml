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

let namespace = "Gio"
let repo = Repository.get_default ()
let typelib = Repository.require repo namespace ()
let interface_name = "TlsServerConnection"

let get_interface_info interface_name =
  match Repository.find_by_name repo namespace interface_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Interface ->
      let interface_info = GIInterfaceInfo.from_baseinfo base_info in
      Some interface_info
    | _ -> None

let interface_test fn =
  match get_interface_info interface_name with
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
      match Base_info.get_name info' with
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
      match Base_info.get_name base_info with
      | None -> assert_equal_string "It should have " " a name"
      | Some name -> assert_equal_string "authentication-mode" name
    )

let test_get_n_methods test_ctxt =
  interface_test (fun info ->
      let n = GIInterfaceInfo.get_n_methods info in
      assert_equal_int 1 n
    )

let test_get_method test_ctxt =
  interface_test (fun info ->
      let info' = GIInterfaceInfo.get_method info 0 in
      let base_info = Function_info.to_baseinfo info' in
      match Base_info.get_name base_info with
      | None -> assert_equal_string "It should have " " a name"
      | Some name -> assert_equal_string "new" name
    )

let test_find_method test_ctxt =
  interface_test (fun info ->
      let method_name = "new" in
      match GIInterfaceInfo.find_method info method_name with
      | None -> assert_equal_string "It should " "return an info"
      | Some info' ->
      let symbol = Function_info.get_symbol info' in
      assert_equal_string ("g_tls_server_connection_"^ method_name) symbol
    )

let volume_interface = "Volume"

let volume_interface_test fn =
  match get_interface_info volume_interface with
  | None -> assert_equal_string interface_name "No base info found"
  | Some (info) -> fn info

let test_get_n_signals test_ctxt =
  volume_interface_test (fun info ->
      let n = GIInterfaceInfo.get_n_signals info in
      assert_equal_int 2 n
    )

let test_get_signal test_ctxt =
  volume_interface_test (fun info ->
      let info' = GIInterfaceInfo.get_signal info 0 in
      let base_info = GISignalInfo.to_baseinfo info' in
      match Base_info.get_name base_info with
      | None -> assert_equal_string "It should have " "a name"
      | Some name -> assert_equal_string "changed" name
    )

let test_find_signal test_ctxt =
  volume_interface_test (fun info ->
      let signal_name = "changed" in
      match GIInterfaceInfo.find_signal info signal_name with
      | None -> assert_equal_string interface_name "No base info found"
      | Some info' -> let base_info = GISignalInfo.to_baseinfo info' in
        match Base_info.get_name base_info with
        | None -> assert_equal_string "It should have " "a name"
        | Some name -> assert_equal_string signal_name name
    )

let test_get_n_constants test_ctxt =
  volume_interface_test (fun info ->
      let n = GIInterfaceInfo.get_n_constants info in
      assert_equal_int 0 n
    )

let test_get_iface_struct test_ctxt =
  volume_interface_test (fun info ->
      match GIInterfaceInfo.get_iface_struct info with
      | None -> assert_equal_string "It would be " "great to have something"
      | Some struct_info -> let base_info = GIStructInfo.to_baseinfo struct_info in
        match Base_info.get_name base_info with
        | None -> assert_equal_string "It should have " "a name"
        | Some name -> assert_equal_string "VolumeIface" name
    )

let test_get_n_vfuncs test_ctxt =
  volume_interface_test (fun info ->
      let n = GIInterfaceInfo.get_n_vfuncs info in
      assert_equal_int 21 n
    )

let test_get_vfunc test_ctxt =
  volume_interface_test (fun info ->
      let info' = GIInterfaceInfo.get_vfunc info 0 in
      let base_info = GIVFuncInfo.to_baseinfo info' in
      match Base_info.get_name base_info with
      | None -> assert_equal_string "It should have " "a name"
      | Some name -> assert_equal_string "can_eject" name
    )

let test_find_vfunc test_ctxt =
  volume_interface_test (fun info ->
      let vfunc_name = "can_eject" in
      match GIInterfaceInfo.find_vfunc info vfunc_name with
      | None -> assert_equal_string interface_name "No base info found"
      | Some info' -> let base_info = GIVFuncInfo.to_baseinfo info' in
        match Base_info.get_name base_info with
        | None -> assert_equal_string "It should have " "a name"
        | Some name -> assert_equal_string name vfunc_name
    )

let tests =
  "GObject Introspection InterfaceInfo tests" >:::
  [
    "GIInterfaceInfo get n prerequisites" >:: test_get_n_prerequisites;
    "GIInterfaceInfo get prerequisiste" >:: test_get_prerequisite;
    "GIInterfaceInfo get n properties" >:: test_get_n_properties;
    "GIInterfaceInfo get property" >:: test_get_property;
    "GIInterfaceInfo get n methods" >:: test_get_n_methods;
    "GIInterfaceInfo get method" >:: test_get_method;
    "GIInterfaceInfo find method" >:: test_find_method;
    "GIInterfaceInfo get n signals" >:: test_get_n_signals;
    "GIInterfaceInfo get signal" >:: test_get_signal;
    "GIInterfaceInfo find signal" >:: test_find_signal;
    "GIInterfaceInfo get n constants" >:: test_get_n_constants;
    "GIInterfaceInfo get iface struct" >:: test_get_iface_struct;
    "GIInterfaceInfo get n vfuncs" >:: test_get_n_vfuncs;
    "GIInterfaceInfo get vfunc" >:: test_get_vfunc;
    "GIInterfaceInfo find vfunc" >:: test_find_vfunc
  ]
