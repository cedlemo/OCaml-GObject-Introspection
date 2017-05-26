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

let test_append_boolean_constant test_ctxt =
  let namespace = "GLib" in
  let name = "SOURCE_REMOVE" in
  let typelib = GIRepository.require repo namespace () in
  constant_test namespace name (fun info ->
      let open Builder in
      let tmp_files = Builder.generate_sources "boolean_constant" in
      let descrs = (tmp_files.mli.descr, tmp_files.ml.descr) in
      let _ = BuilderConstant.append_boolean_constant name info descrs in
      let _ = Builder.close_sources tmp_files in
      assert_equal_boolean true (Sys.file_exists tmp_files.mli.name);
      assert_equal_boolean true (Sys.file_exists tmp_files.ml.name);
      let _ = (let input_ch = open_in tmp_files.mli.name in
        let line = input_line input_ch in
        let _ = assert_equal_string "val source_remove : bool" line in
        close_in input_ch
        ) in

      let _ = (let input_ch = open_in tmp_files.ml.name in
        let line = input_line input_ch in
        let _ = assert_equal_string "let source_remove = false" line in
        close_in input_ch
        ) in

     Sys.remove tmp_files.mli.name;
     Sys.remove tmp_files.ml.name
    )

let tests =
  "GObject Introspection BuilderConstant tests" >:::
  [
    "Append boolean constant" >:: test_append_boolean_constant
  ]
