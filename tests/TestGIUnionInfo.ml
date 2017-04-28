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

let namespace = "GLib"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace
let union_name = "Mutex"

let test_from_baseinfo test_ctxt =
  match GIRepository.find_by_name repo namespace union_name with
  | None -> assert_equal_string union_name "No base info found"
  | Some (base_info) -> assert_equal_boolean true (
      match GIBaseInfo.get_type base_info with
      | GIBaseInfo.Union -> true
      | _ -> false )

let get_union_info () =
  match GIRepository.find_by_name repo namespace union_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Union -> let union_info = GIUnionInfo.unioninfo_of_baseinfo base_info in
      Some union_info
    | _ -> None

let union_test fn =
  match get_union_info () with
  | None -> assert_equal_string union_name "No base info found"
  | Some (info) -> fn info

let test_get_n_fields test_ctxt =
  union_test (fun info ->
    let n = GIUnionInfo.get_n_fields info in
    assert_equal_int 2 n
  )

let tests =
  "GObject Introspection UnionInfo tests" >:::
  [
    "GIUnionInfo from baseinfo" >:: test_from_baseinfo;
    "GIUnionInfo get n fields" >:: test_get_n_fields
  ]
