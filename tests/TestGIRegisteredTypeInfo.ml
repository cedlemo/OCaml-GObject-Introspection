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

let get_enum_info repo namespace enum_name =
  let _ = GIRepository.require repo namespace None 0 () in
  match GIRepository.find_by_name repo namespace enum_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Enum -> let info = GIEnumInfo.from_baseinfo base_info
      in Some info
    | _ -> None

let enum_test fn =
  let namespace = "Gio" in
  let repo = GIRepository.get_default () in
  let enum_name = "ResourceError" in
  match get_enum_info repo namespace enum_name with
  | None -> assert_equal_string enum_name "No base info found"
  | Some (info) -> fn info

let test_get_type_name_from_enum test_ctxt =
  enum_test (fun info ->
      let registered = GIEnumInfo.to_registeredtypeinfo info in
      match  GIRegisteredTypeInfo.get_type_name registered with
      | None -> assert_equal_string "It should return " "a name"
      | Some name -> assert_equal_string "GResourceError" name
    )

let get_interface_info repo namespace interface_name =
  let _ = GIRepository.require repo namespace None 0 () in
  match GIRepository.find_by_name repo namespace interface_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Interface -> let info = GIInterfaceInfo.from_baseinfo base_info
      in Some info
    | _ -> None

let interface_test fn =
  let namespace = "Gio" in
  let repo = GIRepository.get_default () in
  let interface_name = "TlsServerConnection" in
  match get_interface_info repo namespace interface_name with
  | None -> assert_equal_string interface_name "No base info found"
  | Some (info) -> fn info

let test_get_type_name_from_interface test_ctxt =
  interface_test (fun info ->
      let registered = GIInterfaceInfo.to_registeredtypeinfo info in
      match  GIRegisteredTypeInfo.get_type_name registered with
      | None -> assert_equal_string "It should return " "a name"
      | Some name -> assert_equal_string "GTlsServerConnection" name
    )

let tests =
  "GObject Introspection GIRegisteredTypeInfo tests" >:::
  [
    "GIRegisteredTypeInfo get type name from enum" >:: test_get_type_name_from_enum;
    "GIRegisteredTypeInfo get type name from interface" >:: test_get_type_name_from_interface
  ]
