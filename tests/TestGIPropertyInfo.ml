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

let namespace = "Gtk"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace None 0 ()
let property_name = "accept-focus"

let test_get_property_from_repo test_ctxt =
  match GIRepository.find_by_name repo namespace "Window" with
  | None -> assert_equal_string property_name "No base info found"
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Object -> (
        let info = GIObjectInfo.from_baseinfo base_info in
        let prop = GIObjectInfo.get_property info 0 in
        let base_prop = GIPropertyInfo.to_baseinfo prop in
        match  GIBaseInfo.get_type base_prop with
        | GIBaseInfo.Property -> assert_equal true true
        | _ -> assert_equal_string "It should be a" "Property info"
      )
    | _ -> assert_equal_string property_name "No base info found"

let get_property_info () =
  match GIRepository.find_by_name repo namespace "Window" with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Object -> let info = GIObjectInfo.from_baseinfo base_info in
        let prop = GIObjectInfo.get_property info 0 in
        Some prop
    | _ -> None

let property_test fn =
  match get_property_info () with
  | None -> assert_equal_string property_name "No base info found"
  | Some (info) -> fn info

let tests =
  "GObject Introspection InterfaceInfo tests" >:::
  [
    "GIInterfaceInfo find from repo" >:: test_get_property_from_repo
  ]
