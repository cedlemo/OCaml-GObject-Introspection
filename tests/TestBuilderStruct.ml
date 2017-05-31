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

let get_struct_info namespace struct_name =
  match GIRepository.find_by_name repo namespace struct_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Constant -> let struct_info = GIStructInfo.from_baseinfo base_info in
      Some struct_info
    | _ -> None

let struct_test namespace struct_name fn =
  match get_struct_info namespace struct_name with
  | None -> assert_equal_string struct_name "No base info found"
  | Some (info) -> fn info

let file_content_to_string in_ch =
  let rec read_line acc =
    try
      let line = input_line in_ch in read_line (line :: acc)
    with
      End_of_file -> acc
  in let lines = List.rev (read_line []) in
  String.concat "\n" lines

let check_file_and_content name content =
  assert_equal_boolean true (Sys.file_exists name);
  let input_ch = open_in name in
  let lines = file_content_to_string input_ch in
  let _ = assert_equal_string content lines in
  close_in input_ch;
  Sys.remove name


let test_writing_struct namespace name writer mli_content ml_content =
  let _ = GIRepository.require repo namespace () in
  struct_test namespace name (fun info ->
      let open Builder in
      let filename = String.concat "_" [namespace; name; "struct"; "test"] in
      let tmp_files = Builder.generate_sources filename in
      let descrs = (tmp_files.mli.descr, tmp_files.ml.descr) in
      let _ = writer name info descrs in
      let _ = Builder.close_sources tmp_files in
      let _ = check_file_and_content tmp_files.mli.name mli_content in
      check_file_and_content tmp_files.ml.name ml_content
    )

(* TODO : append_ctypes_struct_declaration test *)
let tests =
  "GObject Introspection BuilderStruct tests" >:::
  [
  ]
