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
open GObject_introspection

let namespace = "GObject"
let repo = Repository.get_default ()
let typelib = Repository.require repo namespace ()
let func_name = "signal_name"

let get_arg_info () =
  match Repository.find_by_name repo namespace func_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Function -> let callable_info = Callable_info.from_baseinfo base_info
      in let info = Callable_info.get_arg callable_info 0 in Some info
    | _ -> None

let arg_test fn =
  match get_arg_info () with
  | None -> assert_equal_string func_name "No base info found"
  | Some (info) -> fn info

let test_get_direction test_ctxt =
  arg_test (fun info ->
      let dir = Arg_info.get_direction info in
      assert_equal ~printer:(fun d ->
          match d with
          | Arg_info.In -> "In"
          | Arg_info.Out -> "Out"
          | Arg_info.InOut -> "InOut") Arg_info.In dir
    )

let test_get_closure test_ctxt =
  arg_test (fun info ->
      let closure = Arg_info.get_closure info in
      assert_equal_int (-1) closure
    )

let test_get_destroy test_ctxt =
  arg_test (fun info ->
      let index = Arg_info.get_destroy info in
      assert_equal_int (-1) index
    )

let test_get_ownership_transfer test_ctxt =
  arg_test (fun info ->
      let transfer = Arg_info.get_ownership_transfer info in
      assert_equal ~printer:(fun t ->
          match t with
          | Arg_info.Nothing -> "nothing"
          | Arg_info.Container -> "container"
          | Arg_info.Everything -> "everything"
        ) Arg_info.Nothing transfer
    )

let test_may_be_null test_ctxt =
  arg_test (fun info ->
      let may_be_null = Arg_info.may_be_null info in
      assert_equal_boolean false may_be_null
    )

let test_is_caller_allocates test_ctxt =
  arg_test (fun info ->
      let caller_allocates = Arg_info.is_caller_allocates info in
      assert_equal_boolean false caller_allocates
    )

let test_is_optional test_ctxt =
  arg_test (fun info ->
      let is_optional = Arg_info.is_optional info in
      assert_equal_boolean false is_optional
    )

let test_is_return_value test_ctxt =
  arg_test (fun info ->
      let is_return = Arg_info.is_return_value info in
      assert_equal_boolean false is_return
    )

let test_is_skip test_ctxt =
  arg_test (fun info ->
      let is_skip = Arg_info.is_skip info in
      assert_equal_boolean false is_skip
    )

let test_get_scope test_ctxt =
  arg_test (fun info ->
      let scope = Arg_info.get_scope info in
      assert_equal ~printer:(fun scope ->
          match scope with
          | Arg_info.Invalid -> "Invalid"
          | Arg_info.Call -> "Call"
          | Arg_info.Async -> "Async"
          | Arg_info.Notified -> "Notified"
        ) Arg_info.Invalid scope
    )

let test_get_type test_ctxt =
  arg_test (fun info ->
        let type_info = Arg_info.get_type info in
        let type_name = Type_info.to_string type_info in
        assert_equal_string "unknown" type_name
      )

let tests =
  "GObject Introspection ArgInfo tests" >:::
  [
    "Arg_info get direction" >:: test_get_direction;
    "Arg_info get closure" >:: test_get_closure;
    "Arg_info get destroy" >:: test_get_destroy;
    "Arg_info get ownership transfer" >:: test_get_ownership_transfer;
    "Arg_info may be null" >:: test_may_be_null;
    "Arg_info is caller allocates" >:: test_is_caller_allocates;
    "Arg_info is optional" >:: test_is_optional;
    "Arg_info is return value" >:: test_is_return_value;
    "Arg_info is skip" >:: test_is_skip;
    "Arg_info get scope" >:: test_get_scope;
    "Arg_info get type" >:: test_get_type
  ]
