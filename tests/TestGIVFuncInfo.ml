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

let namespace = "Gtk"
let repo = Repository.get_default ()
let typelib = Repository.require repo namespace ()
let object_name = "Window"
let vfunc_name = "activate_default"

let get_vfunc_info () =
  match Repository.find_by_name repo namespace object_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Object -> let object_info = GIObjectInfo.from_baseinfo base_info in
      GIObjectInfo.find_vfunc object_info vfunc_name
    | _ -> None

let vfunc_test fn =
  match get_vfunc_info () with
  | None -> assert_equal_string object_name "No base info found"
  | Some (info) -> fn info

let test_get_offset test_ctxt =
  vfunc_test (fun info ->
      let offset = GIVFuncInfo.get_offset info in
      assert_equal_int 0xFFFF offset
    )

let test_get_signal test_ctxt =
  vfunc_test (fun info ->
      match GIVFuncInfo.get_signal info with
      | None -> assert_equal_boolean true true
      | Some info' -> assert_equal_string "It should no return " "a callable info"
    )

let test_get_flags test_ctxt =
  vfunc_test (fun info ->
      let flags = GIVFuncInfo.get_flags info in
      let rec check_flag = function
        | [] -> ()
        | flag :: remain ->let _ = assert_equal ~printer:(fun f ->
            GIVFuncInfo.string_of_flags f
          ) GIVFuncInfo.Must_override flag in
          check_flag remain
      in check_flag flags;
      assert_equal [] flags
    )

let tests =
  "GObject Introspection VFuncInfo tests" >:::
  [
    "GIVFuncInfo get offset" >:: test_get_offset;
    "GIVFuncInfo get signal" >:: test_get_signal;
    "GIVFuncInfo get flags" >:: test_get_flags
  ]


