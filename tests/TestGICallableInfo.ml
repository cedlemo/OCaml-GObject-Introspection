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

let test_get_n_args test_ctxt =
  callable_test (fun info ->
      let n = GICallableInfo.get_n_args info in
      assert_equal_int 1 n
    )

let test_get_return_attribute test_ctxt =
  callable_test (fun info ->
      match GICallableInfo.get_return_attribute info with
      | None -> assert_equal_boolean true true
      | Some attribute -> assert_equal_string "This should not return a string" attribute
    )

let test_is_method test_ctxt =
  callable_test (fun info ->
      let is_method = GICallableInfo.is_method info in
      assert_equal_boolean false is_method
    )

let test_may_return_null test_ctxt =
  callable_test (fun info ->
      let may_return_null = GICallableInfo.may_return_null info in
      assert_equal_boolean false may_return_null
    )

let test_skip_return test_ctxt =
  callable_test (fun info ->
      let skip_return = GICallableInfo.skip_return info in
      assert_equal_boolean false skip_return
    )

let test_get_caller_owns test_ctxt =
  callable_test (fun info ->
      let transfer = GICallableInfo.get_caller_owns info in
      assert_equal ~printer:(fun t ->
          match t with
          | GIArgInfo.Nothing -> "nothing"
          | GIArgInfo.Container -> "container"
          | GIArgInfo.Everything -> "everything"
        ) GIArgInfo.Nothing transfer
    )

let tests =
  "GObject Introspection CallableInfo tests" >:::
  [
    "GICallableInfo can throw gerror" >:: test_can_throw_gerror;
    "GICallableInfo get n args" >:: test_get_n_args;
    "GICallableInfo get return attribute" >:: test_get_return_attribute;
    "GICallableInfo is method" >:: test_is_method;
    "GICallableInfo may return null" >:: test_may_return_null;
    "GICallableInfo skip return" >:: test_skip_return;
    "GICallableInfo get caller owns" >:: test_get_caller_owns
  ]
