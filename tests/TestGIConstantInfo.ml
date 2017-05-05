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

let namespace = "GObject"
let repo = GIRepository.get_default ()
let typelib = GIRepository.require repo namespace None 0 ()
let const_name = "SIGNAL_FLAGS_MASK"

let get_constant_info () =
  match GIRepository.find_by_name repo namespace const_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Constant -> let const_info = GIConstantInfo.constantinfo_of_baseinfo base_info in
      Some const_info
    | _ -> None

let const_test fn =
  match get_constant_info () with
  | None -> assert_equal_string const_name "No base info found"
  | Some (info) -> fn info

let tests =
  "GObject Introspection ConstantInfo tests" >:::
  [
  ]
