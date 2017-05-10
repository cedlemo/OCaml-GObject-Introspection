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
let name = "signal_name"

let get_function_info () =
  match GIRepository.find_by_name repo namespace name with
  | None -> None
  | Some (base_info) -> match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function -> let info = GIFunctionInfo.functioninfo_of_baseinfo base_info in
      Some info
    | _ -> None

let test_function_info fn =
  match get_function_info () with
  | None -> assert_equal_string name "No base info found"
  | Some info -> fn info

let test_get_symbol test_ctxt =
  test_function_info (fun info ->
      assert_equal "g_signal_name" (GIFunctionInfo.get_symbol info)
    )

let test_get_flags test_ctxt =
  test_function_info (fun info ->
      assert_equal [] (GIFunctionInfo.get_flags info)
    )
(*
let test_get_symbol test_ctxt =
  let fn_name = "signal_name" in
  match GIRepository.find_by_name repo namespace fn_name with
  | None -> assert_equal_string fn_name "No base info found"
  | Some (base_info) -> match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function ->
      let fn_info = GIFunctionInfo.functioninfo_of_baseinfo base_info in
      assert_equal "g_signal_name" (GIFunctionInfo.get_symbol fn_info)
    | _ -> assert_equal_string "Base info" "Wrong info type"

let test_get_flags test_ctxt =
  let fn_name = "signal_name" in
  match GIRepository.find_by_name repo namespace fn_name with
  | None -> assert_equal_string fn_name "No base info found"
  | Some (base_info) -> match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function ->
      let fn_info = GIFunctionInfo.functioninfo_of_baseinfo base_info in
      assert_equal [] (GIFunctionInfo.get_flags fn_info)
    | _ -> assert_equal_string "Base info" "Wrong info type"
*)
let tests =
  "GObject Introspection FunctionInfo tests" >:::
  [
    "GIFunctionInfo get symbol" >:: test_get_symbol;
    "GIFunctionInfo get flags" >:: test_get_flags
  ]
