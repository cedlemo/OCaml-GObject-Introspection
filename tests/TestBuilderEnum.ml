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

let get_enum_info namespace enum_name =
  match GIRepository.find_by_name repo namespace enum_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Enum -> let enum_info = GIEnumInfo.from_baseinfo base_info in
      Some enum_info
    | _ -> None

let enum_test namespace enum_name fn =
  match get_enum_info namespace enum_name with
  | None -> assert_equal_string enum_name "No base info found"
  | Some (info) -> fn info

let test_writing_enum namespace name writer mli_content ml_content =
  let _ = GIRepository.require repo namespace () in
  enum_test namespace name (fun info ->
      let open Builder in
      let filename = String.concat "_" [namespace; name; "enum"; "test"] in
      let tmp_files = Builder.generate_sources filename in
      let descrs = (tmp_files.mli.descr, tmp_files.ml.descr) in
      let _ = writer name info descrs in
      let _ = Builder.close_sources tmp_files in
      let _ = check_file_and_content tmp_files.mli.name mli_content in
      TestUtils.check_file_and_content tmp_files.ml.name ml_content
    )

let tests =
  "GObject Introspection BuilderEnum tests" >:::
  [
  ]
