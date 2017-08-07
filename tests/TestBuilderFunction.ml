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

let repo = GIRepository.get_default ()
let namespace = "GLib"
let typelib = GIRepository.require repo namespace ()
let name = "ascii_strncasecmp"

let get_function_info name () =
  match GIRepository.find_by_name repo namespace name with
  | None -> None
  | Some (base_info) -> match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Function -> let info = GIFunctionInfo.from_baseinfo base_info in
      Some info
    | _ -> None

let test_function_info name fn =
  match get_function_info name () with
  | None -> assert_equal_string name "No base info found"
  | Some info -> fn info

let test_get_arguments_types test_ctx =
  test_function_info name (fun info ->
      let callable = GIFunctionInfo.to_callableinfo info in
      match BuilderFunction.get_arguments_types callable with
      | None -> assert_equal_string "It should returns " "Ctypes arguments"
      | Some l -> let ocaml_types = String.concat " -> " (List.map (fun (a, b) -> a) l) in
        assert_equal_string "string -> string -> Unsigned.uint64" ocaml_types;
        let ctypes_types = String.concat " -> " (List.map (fun (a, b) -> b) l) in
        assert_equal_string "string -> string -> uint64_t" ctypes_types;
    )

let test_get_return_types test_ctx =
  test_function_info name (fun info ->
      let callable = GIFunctionInfo.to_callableinfo info in
      match BuilderFunction.get_return_types callable with
      | None -> assert_equal_string "It should returns " "the return value ocaml and ctypes types"
      | Some (ocaml_type, ctypes_type) ->
        assert_equal_string "int32" ocaml_type;
        assert_equal_string "int32_t" ctypes_type
    )

let test_escape_bad_function_name test_ctxt =
  let container = "Rand" in
  match GIRepository.find_by_name repo namespace container with
  | None -> assert_equal_string name " should return an I info"
  | Some rand_info -> let struct_info = GIStructInfo.from_baseinfo rand_info in
  let method_info = GIStructInfo.get_method struct_info 0 in
  let mli_content = "val _double:\n\
                     t structure ptr -> float" in
  let ml_content = "let _double =\n\
                    foreign \"g_rand_double\" (ptr t_typ @-> returning (double))" in
  let writer = fun name info (mli, ml) ->
    BuilderFunction.append_ctypes_method_bindings name info container (mli, ml)
  in
  TestUtils.test_writing test_ctxt method_info "double" writer mli_content ml_content

let tests =
  "GObject Introspection BuilderFunction tests" >:::
  [
    "BuilderFunction get arguments ctypes" >:: test_get_arguments_types;
    "BuilderFunction get return types" >:: test_get_return_types;
    "BuilderFunction escape bad function name" >:: test_escape_bad_function_name
  ]
