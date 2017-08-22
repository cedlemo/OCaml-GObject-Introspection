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

let get_enum_info repo namespace enum_name =
  let _ = Repository.require repo namespace () in
  match Repository.find_by_name repo namespace enum_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Enum -> let info = Enum_info.from_baseinfo base_info
      in Some info
    | _ -> None

let enum_test fn =
  let namespace = "Gio" in
  let repo = Repository.get_default () in
  let enum_name = "ResourceError" in
  match get_enum_info repo namespace enum_name with
  | None -> assert_equal_string enum_name "No base info found"
  | Some (info) -> fn info

let test_get_type_name_from_enum test_ctxt =
  enum_test (fun info ->
      let registered = Enum_info.to_registeredtypeinfo info in
      match  Registered_type_info.get_type_name registered with
      | None -> assert_equal_string "It should return " "a name"
      | Some name -> assert_equal_string "GResourceError" name
    )

let get_interface_info repo namespace interface_name =
  let _ = Repository.require repo namespace () in
  match Repository.find_by_name repo namespace interface_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Interface -> let info = Interface_info.from_baseinfo base_info
      in Some info
    | _ -> None

let interface_test fn =
  let namespace = "Gio" in
  let repo = Repository.get_default () in
  let interface_name = "TlsServerConnection" in
  match get_interface_info repo namespace interface_name with
  | None -> assert_equal_string interface_name "No base info found"
  | Some (info) -> fn info

let test_get_type_name_from_interface test_ctxt =
  interface_test (fun info ->
      let registered = Interface_info.to_registeredtypeinfo info in
      match  Registered_type_info.get_type_name registered with
      | None -> assert_equal_string "It should return " "a name"
      | Some name -> assert_equal_string "GTlsServerConnection" name
    )

let get_object_info repo namespace object_name =
  let _ = Repository.require repo namespace () in
  match Repository.find_by_name repo namespace object_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Object -> let info = Object_info.from_baseinfo base_info
      in Some info
    | _ -> None

let object_test fn =
  let namespace = "Gdk" in
  let repo = Repository.get_default () in
  let object_name = "Display" in
  match get_object_info repo namespace object_name with
  | None -> assert_equal_string object_name "No base info found"
  | Some (info) -> fn info

let test_get_type_name_from_object test_ctxt =
  object_test (fun info ->
      let registered = Object_info.to_registeredtypeinfo info in
      match  Registered_type_info.get_type_name registered with
      | None -> assert_equal_string "It should return " "a name"
      | Some name -> assert_equal_string "GdkDisplay" name
    )

let get_struct_info repo namespace struct_name =
  let _ = Repository.require repo namespace () in
  match Repository.find_by_name repo namespace struct_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Struct -> let info = GIStructInfo.from_baseinfo base_info
      in Some info
    | _ -> None

let struct_test fn =
  let namespace = "GObject" in
  let repo = Repository.get_default () in
  let struct_name = "Value" in
  match get_struct_info repo namespace struct_name with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (info) -> fn info

let test_get_type_name_from_struct test_ctxt =
  struct_test (fun info ->
      let registered = GIStructInfo.to_registeredtypeinfo info in
      match  Registered_type_info.get_type_name registered with
      | None -> assert_equal_string "It should return " "a name"
      | Some name -> assert_equal_string "GValue" name
    )

let get_union_info repo namespace union_name =
  let _ = Repository.require repo namespace () in
  match Repository.find_by_name repo namespace union_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Union -> let info = GIUnionInfo.from_baseinfo base_info
      in Some info
    | _ -> None

let union_test fn =
  let namespace = "GLib" in
  let repo = Repository.get_default () in
  let union_name = "Mutex" in
  match get_union_info repo namespace union_name with
  | None -> assert_equal_string union_name "No base info found"
  | Some (info) -> fn info

let test_get_type_name_from_union test_ctxt =
  union_test (fun info ->
      let registered = GIUnionInfo.to_registeredtypeinfo info in
      match  Registered_type_info.get_type_name registered with
      | None -> assert_equal_string "No type name" "No type name"
      | Some name -> assert_equal_string "Mutex" name
    )

let test_get_type_from_enum test_ctxt =
  enum_test (fun info ->
      let registered = Enum_info.to_registeredtypeinfo info in
      match  Registered_type_info.get_g_type registered with
      | None -> assert_equal_string "It should return " "a type"
      | Some gtype -> let repo = Repository.get_default () in
        match Repository.find_by_gtype repo gtype with
        | None -> assert_equal_string "It should return " "a base info"
        | Some base_info -> match Base_info.get_name base_info with
          | None -> assert_equal_string "It should return " "a name"
          | Some name -> assert_equal_string "ResourceError" name
    )

  (* TODO create a GType module GType.t GType.of_int64 , GType.to_int64, GType.typ *)

let test_get_type_init_from_union test_ctxt =
  union_test (fun info ->
      let registered = GIUnionInfo.to_registeredtypeinfo info in
      match Registered_type_info.get_type_init registered with
      | None -> assert_equal_string "No type init" "No type init"
      | Some name -> assert_equal_string "It should not return" name
    )

let test_get_type_init_from_enum test_ctxt =
  enum_test (fun info ->
      let registered = Enum_info.to_registeredtypeinfo info in
      match Registered_type_info.get_type_init registered with
      | None -> assert_equal_string "It should have a " "type init"
      | Some name -> assert_equal_string "g_resource_error_get_type" name
    )

let tests =
  "GObject Introspection Registered_type_info tests" >:::
  [
    "Registered_type_info get type name from enum" >:: test_get_type_name_from_enum;
    "Registered_type_info get type name from interface" >:: test_get_type_name_from_interface;
    "Registered_type_info get type name from object" >:: test_get_type_name_from_object;
    "Registered_type_info get type name from struct" >:: test_get_type_name_from_struct;
    "Registered_type_info get type name from union" >:: test_get_type_name_from_union;
    "Registered_type_info get type from enum" >:: test_get_type_from_enum;
    "Registered_type_info get type init from union" >:: test_get_type_init_from_union;
    "Registered_type_info get type init from enum" >:: test_get_type_init_from_enum
  ]
