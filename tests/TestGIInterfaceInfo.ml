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

let namespace = "Atk"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace None 0 ()
let interface_name = "ImplementorIface"

let test_get_interface_from_repo test_ctxt =
  match GIRepository.find_by_name repo namespace interface_name with
  | None -> assert_equal_string interface_name "No base info found"
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Interface -> (
        match GIBaseInfo.get_name base_info with
        | None -> assert_equal_string interface_name "No name found"
        | Some name -> assert_equal_string name interface_name
      )
    | _ -> assert_equal_string interface_name "No base info found"

let get_interface_info () =
  match GIRepository.find_by_name repo namespace interface_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Interface -> let interface_info = GIInterfaceInfo.interfaceinfo_of_baseinfo base_info in
      Some interface_info
    | _ -> None

let interface_test fn =
  match get_interface_info () with
  | None -> assert_equal_string interface_name "No base info found"
  | Some (info) -> fn info


let tests =
  "GObject Introspection InterfaceInfo tests" >:::
  [
    "GIInterfaceInfo find from repo" >:: test_get_interface_from_repo
  ]
