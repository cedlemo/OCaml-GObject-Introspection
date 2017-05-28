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

let repo = GIRepository.get_default ()

let get_constant_info namespace const_name =
  match GIRepository.find_by_name repo namespace const_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Constant -> let const_info = GIConstantInfo.from_baseinfo base_info in
      Some const_info
    | _ -> None

let constant_test namespace const_name fn =
  match get_constant_info namespace const_name with
  | None -> assert_equal_string const_name "No base info found"
  | Some (info) -> fn info

let check_file_and_first_line name content =
  assert_equal_boolean true (Sys.file_exists name);
  let input_ch = open_in name in
  let line = input_line input_ch in
  let _ = assert_equal_string content line in
  close_in input_ch;
  Sys.remove name


let test_writing_constant namespace name writer mli_content ml_content =
  let _ = GIRepository.require repo namespace () in
  constant_test namespace name (fun info ->
      let open Builder in
      let filename = String.concat "_" [namespace; name; "constant"; "test"] in
      let tmp_files = Builder.generate_sources filename in
      let descrs = (tmp_files.mli.descr, tmp_files.ml.descr) in
      let _ = writer name info descrs in
      let _ = Builder.close_sources tmp_files in
      let _ = check_file_and_first_line tmp_files.mli.name mli_content in
      check_file_and_first_line tmp_files.ml.name ml_content
    )

let test_append_boolean_constant test_ctxt =
  let namespace = "GLib" in
  let name = "SOURCE_REMOVE" in
  let writer = BuilderConstant.append_boolean_constant in
  let mli_content = "val source_remove : bool" in
  let ml_content = "let source_remove = false" in
  test_writing_constant namespace name writer mli_content ml_content

let test_append_int8_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXINT8" in
  let writer = BuilderConstant.append_int8_constant in
  let mli_content = "val maxint8 : int" in
  let ml_content = "let maxint8 = 127" in
  test_writing_constant namespace name writer mli_content ml_content

let test_append_uint8_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXUINT8" in
  let writer = BuilderConstant.append_uint8_constant in
  let mli_content = "val maxuint8 : Unsigned.uint8" in
  let ml_content = "let maxuint8 = 255" in
  test_writing_constant namespace name writer mli_content ml_content

let test_append_int16_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXINT16" in
  let writer = BuilderConstant.append_int16_constant in
  let mli_content = "val maxint16 : int" in
  let ml_content = "let maxint16 = 32767" in
  test_writing_constant namespace name writer mli_content ml_content

let test_append_uint16_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXUINT16" in
  let writer = BuilderConstant.append_uint16_constant in
  let mli_content = "val maxuint16 : Unsigned.uint16" in
  let ml_content = "let maxuint16 = 65535" in
  test_writing_constant namespace name writer mli_content ml_content

let test_append_int32_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXINT32" in
  let writer = BuilderConstant.append_int32_constant in
  let mli_content = "val maxint32 : Int32" in
  let ml_content = "let maxint32 = 2147483647" in
  test_writing_constant namespace name writer mli_content ml_content

let test_append_uint32_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXUINT32" in
  let writer = BuilderConstant.append_uint32_constant in
  let mli_content = "val maxuint32 : Unsigned.uint32" in
  let ml_content = "let maxuint32 = 4294967295" in
  test_writing_constant namespace name writer mli_content ml_content

let test_append_int64_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXINT64" in
  let writer = BuilderConstant.append_int64_constant in
  let mli_content = "val maxint64 : Int64" in
  let ml_content = "let maxint64 = 9223372036854775807" in
  test_writing_constant namespace name writer mli_content ml_content

let test_append_uint64_constant test_ctxt =
  let namespace = "GLib" in
  let name = "MAXUINT64" in
  let writer = BuilderConstant.append_uint64_constant in
  let mli_content = "val maxuint64 : Unsigned.uint64" in
  let ml_content = "let maxuint64 = 18446744073709551615" in
  test_writing_constant namespace name writer mli_content ml_content

(* TODO : test_append_gfloat_constant -> find an example *)

let tests =
  "GObject Introspection BuilderConstant tests" >:::
  [
    "Append boolean constant" >:: test_append_boolean_constant;
    "Append int8 constant" >:: test_append_int8_constant;
    "Append uint8 constant" >:: test_append_uint8_constant;
    "Append int 16 constant" >:: test_append_int16_constant;
    "Append uint 16 constant" >:: test_append_uint16_constant;
    "Append int32 constant" >:: test_append_int32_constant;
    "Append uint32 constant" >:: test_append_uint32_constant;
    "Append int64 constant" >:: test_append_int64_constant;
    "Append uint64 constant" >:: test_append_uint64_constant
  ]
