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
let typelib = GIRepository.require repo namespace
let func_name = "signal_name"

let get_callable_info () =
  match GIRepository.find_by_name repo namespace func_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function -> let info = GICallableInfo.callableinfo_of_baseinfo base_info
      in Some info
    | _ -> None

let callable_test fn =
  match get_callable_info () with
  | None -> assert_equal_string func_name "No base info found"
  | Some (info) -> fn info

let test_can_throw_gerror test_ctxt =
  callable_test (fun info ->
      let throw_error = GICallableInfo.can_throw_gerror info in
      assert_equal_boolean false throw_error
    )
let tests =
  "GObject Introspection CallableInfo tests" >:::
  [
    "GCallableInfo can throw gerror" >:: test_can_throw_gerror
  ]
