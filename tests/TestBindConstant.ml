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

let repo = Repository.get_default ()

let get_constant_info namespace const_name =
  match Repository.find_by_name repo namespace const_name with
  | None -> None
  | Some (base_info) ->
    match Base_info.get_type base_info with
    | Base_info.Constant -> let const_info = Constant_info.from_baseinfo base_info in
      Some const_info
    | _ -> None

let constant_test namespace const_name fn =
  match get_constant_info namespace const_name with
  | None -> assert_equal_string const_name "No base info found"
  | Some (info) -> fn info

let test_append_boolean_constant test_ctxt =
  let namespace = "GLib" in
  let name = "SOURCE_REMOVE" in
  let writer = Bind_constant.append_boolean_constant in
  let mli_content = "val _SOURCE_REMOVE : bool" in
  let ml_content = "let _SOURCE_REMOVE = false" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_int8_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXINT8" in
  let writer = Bind_constant.append_int8_constant in
  let mli_content = "val _MAXINT8 : int" in
  let ml_content = "let _MAXINT8 = 127" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_uint8_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXUINT8" in
  let writer = Bind_constant.append_uint8_constant in
  let mli_content = "val _MAXUINT8 : Unsigned.uint8" in
  let ml_content = "let _MAXUINT8 = Unsigned.UInt8.of_int 255" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_int16_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXINT16" in
  let writer = Bind_constant.append_int16_constant in
  let mli_content = "val _MAXINT16 : int" in
  let ml_content = "let _MAXINT16 = 32767" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_uint16_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXUINT16" in
  let writer = Bind_constant.append_uint16_constant in
  let mli_content = "val _MAXUINT16 : Unsigned.uint16" in
  let ml_content = "let _MAXUINT16 = Unsigned.UInt16.of_int 65535" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_int32_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXINT32" in
  let writer = Bind_constant.append_int32_constant in
  let mli_content = "val _MAXINT32 : int32" in
  let ml_content = "let _MAXINT32 = Int32.of_string \"2147483647\"" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_uint32_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXUINT32" in
  let writer = Bind_constant.append_uint32_constant in
  let mli_content = "val _MAXUINT32 : Unsigned.uint32" in
  let ml_content = "let _MAXUINT32 = Unsigned.UInt32.of_string \"4294967295\"" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_int64_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXINT64" in
  let writer = Bind_constant.append_int64_constant in
  let mli_content = "val _MAXINT64 : int64" in
  let ml_content = "let _MAXINT64 = 9223372036854775807L" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_uint64_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXUINT64" in
  let writer = Bind_constant.append_uint64_constant in
  let mli_content = "val _MAXUINT64 : Unsigned.uint64" in
  let ml_content = "let _MAXUINT64 = Unsigned.UInt64.of_string \"18446744073709551615\"" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

(* TODO : test_append_float_constant -> find an example *)

let test_append_double_constant test_ctxt =
  let namespace = "GLib" in
  let name = "E" in
  let writer = Bind_constant.append_double_constant in
  let mli_content = "val _E : float" in
  let ml_content = "let _E = 2.718282" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_string_constant test_ctxt =
  let namespace = "GLib" in
  let name = "CSET_A_2_Z" in
  let writer = Bind_constant.append_string_constant in
  let mli_content = "val _CSET_A_2_Z : string" in
  let ml_content = "let _CSET_A_2_Z = \"ABCDEFGHIJKLMNOPQRSTUVWXYZ\"" in
  constant_test namespace name (fun info ->
      test_writing test_ctxt info name writer mli_content ml_content
    )

let tests =
  "GObject Introspection Bind_constant tests" >:::
  [
    "Append boolean constant" >:: test_append_boolean_constant;
    "Append int8 constant" >:: test_append_int8_constant;
    "Append uint8 constant" >:: test_append_uint8_constant;
    "Append int16 constant" >:: test_append_int16_constant;
    "Append uint16 constant" >:: test_append_uint16_constant;
    "Append int32 constant" >:: test_append_int32_constant;
    "Append uint32 constant" >:: test_append_uint32_constant;
    "Append int64 constant" >:: test_append_int64_constant;
    "Append uint64 constant" >:: test_append_uint64_constant;
    "Append double constant" >:: test_append_double_constant;
    "Append string constant" >:: test_append_string_constant
  ]
