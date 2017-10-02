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

open Test_utils
open OUnit2
open GObject_introspection

let repo = Repository.get_default ()
let namespace = "GLib"
let typelib = Repository.require repo namespace ()
let name = "ascii_strncasecmp"

let get_function_info name () =
  match Repository.find_by_name repo namespace name with
  | None -> None
  | Some (base_info) -> match Base_info.get_type base_info with
    | Base_info.Function -> let info = Function_info.from_baseinfo base_info in
      Some info
    | _ -> None

let test_function_info name fn =
  match get_function_info name () with
  | None -> assert_equal_string name "No base info found"
  | Some info -> fn info

let test_get_arguments_types test_ctx =
  test_function_info name (fun info ->
      let callable = Function_info.to_callableinfo info in
      match Bind_function.get_arguments_types callable [] with
      | Bind_function.Type_names l -> let ocaml_types = String.concat " -> " (List.map (fun (a, b) -> a) l) in
        assert_equal_string "string -> string -> Unsigned.uint64" ocaml_types;
        let ctypes_types = String.concat " -> " (List.map (fun (a, b) -> b) l) in
        assert_equal_string "string -> string -> uint64_t" ctypes_types;
      | _ -> assert_equal_string "It should returns " "Ctypes arguments"
    )

let test_get_return_types test_ctx =
  test_function_info name (fun info ->
      let callable = Function_info.to_callableinfo info in
      match Bind_function.get_return_types callable [] with
      | Type_names types -> let (ocaml_type, ctypes_type) = List.hd types in
        assert_equal_string "int32" ocaml_type;
        assert_equal_string "int32_t" ctypes_type
      | _ -> assert_equal_string "It should returns " "the return value ocaml and ctypes types"
    )

let test_escape_bad_function_name test_ctxt =
  let container = "Rand" in
  match Repository.find_by_name repo namespace container with
  | None -> assert_equal_string name " should return an I info"
  | Some rand_info -> let struct_info = Struct_info.from_baseinfo rand_info in
  let method_info = Struct_info.get_method struct_info 0 in
  let mli_content = "val _double:\n\
                     t structure ptr -> float\n" in
  let ml_content = "let _double =\n\
                    foreign \"g_rand_double\" (ptr t_typ @-> returning (double))\n" in
  let writer = fun name info sources ->
    let _ = Bind_function.append_ctypes_method_bindings name info container sources [] in
    Binding_utils.Sources.write_buffs sources
  in
  Test_utils.test_writing test_ctxt method_info "double" writer mli_content ml_content

let tests =
  "GObject Introspection Bind_function tests" >:::
  [
    "Bind_function get arguments ctypes" >:: test_get_arguments_types;
    "Bind_function get return types" >:: test_get_return_types;
    "Bind_function escape bad function name" >:: test_escape_bad_function_name
  ]
