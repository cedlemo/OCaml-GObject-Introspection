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

let get_arg_info () =
  match GIRepository.find_by_name repo namespace func_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function -> let callable_info = GICallableInfo.callableinfo_of_baseinfo base_info
      in let info = GICallableInfo.get_arg callable_info 0 in Some info
    | _ -> None

let arg_test fn =
  match get_arg_info () with
  | None -> assert_equal_string func_name "No base info found"
  | Some (info) -> fn info

let test_get_direction test_ctxt =
  arg_test (fun info ->
      let dir = GIArgInfo.get_direction info in
      assert_equal ~printer:(fun d ->
          match d with
          | GIArgInfo.In -> "In"
          | GIArgInfo.Out -> "Out"
          | GIArgInfo.InOut -> "InOut") GIArgInfo.In dir
    )

let test_get_closure test_ctxt =
  arg_test (fun info ->
      let closure = GIArgInfo.get_closure info in
      assert_equal_int (-1) closure
    )

let test_get_destroy test_ctxt =
  arg_test (fun info ->
      let index = GIArgInfo.get_destroy info in
      assert_equal_int (-1) index
    )

let test_get_ownership_transfer test_ctxt =
  arg_test (fun info ->
      let transfer = GIArgInfo.get_ownership_transfer info in
      assert_equal ~printer:(fun t ->
          match t with
          | GIArgInfo.Nothing -> "nothing"
          | GIArgInfo.Container -> "container"
          | GIArgInfo.Everything -> "everything"
        ) GIArgInfo.Nothing transfer
    )

let test_may_be_null test_ctxt =
  arg_test (fun info ->
      let may_be_null = GIArgInfo.may_be_null info in
      assert_equal_boolean false may_be_null
    )

let test_is_caller_allocates test_ctxt =
  arg_test (fun info ->
      let caller_allocates = GIArgInfo.is_caller_allocates info in
      assert_equal_boolean false caller_allocates
    )

let test_is_optional test_ctxt =
  arg_test (fun info ->
      let is_optional = GIArgInfo.is_optional info in
      assert_equal_boolean false is_optional
    )

let test_is_return_value test_ctxt =
  arg_test (fun info ->
      let is_return = GIArgInfo.is_return_value info in
      assert_equal_boolean false is_return
    )

let test_is_skip test_ctxt =
  arg_test (fun info ->
      let is_skip = GIArgInfo.is_skip info in
      assert_equal_boolean false is_skip
    )

let tests =
  "GObject Introspection ArgInfo tests" >:::
  [
    "GIArgInfo get direction" >:: test_get_direction;
    "GIArgInfo get closure" >:: test_get_closure;
    "GIArgInfo get destroy" >:: test_get_destroy;
    "GIArgInfo get ownership transfer" >:: test_get_ownership_transfer;
    "GIArgInfo may be null" >:: test_may_be_null;
    "GIArgInfo is caller allocates" >:: test_is_caller_allocates;
    "GIArgInfo is optional" >:: test_is_optional;
    "GIArgInfo is return value" >:: test_is_return_value;
    "GIArgInfo is skip" >:: test_is_skip
  ]
