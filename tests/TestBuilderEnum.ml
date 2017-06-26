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

let test_rebuild_c_identifier_for_constant test_ctxt =
  enum_test "GLib" "ChecksumType" (fun info ->
      match GIEnumInfo.get_value info 0 with
      | None -> assert_equal_string "It should " "have a value"
      | Some value_info ->
        let base_info = GIEnumInfo.to_baseinfo info in
        match GIBaseInfo.get_name base_info with
        | None -> assert_equal_string "It should " "have a name"
        | Some name ->
          let c_identifier = BuilderEnum.rebuild_c_identifier_for_constant name value_info in
          assert_equal_string "G_CHECKSUM_MD5" c_identifier
    )

let enum_to_type = "type checksumtype = Md5 | Sha1 | Sha256 | Sha512 | Sha384"
let enum_to_type_travis = "type checksumtype = Md5 | Sha1 | Sha256 | Sha512"
let enum_type_of_value_sig = "val checksumtype_of_value:\n\
                              Unsigned.uint32 -> checksumtype"

let enum_type_of_value = "let checksumtype_of_value = function\n\
                          | Unsigned.UInt32.of_int64 0 -> Md5\n\
                          | Unsigned.UInt32.of_int64 1 -> Sha1\n\
                          | Unsigned.UInt32.of_int64 2 -> Sha256\n\
                          | Unsigned.UInt32.of_int64 3 -> Sha512\n\
                          | Unsigned.UInt32.of_int64 4 -> Sha384\n\
                          | _ -> raise (Invalid_argument \"Unexpected ChecksumType value\")"

let enum_type_of_value_travis = "let checksumtype_of_value = function\n\
                                 | Unsigned.UInt32.of_int64 0 -> Md5\n\
                                 | Unsigned.UInt32.of_int64 1 -> Sha1\n\
                                 | Unsigned.UInt32.of_int64 2 -> Sha256\n\
                                 | Unsigned.UInt32.of_int64 3 -> Sha512\n\
                                 | _ -> raise (Invalid_argument \"Unexpected ChecksumType value\")"


let enum_type_to_value_sig = "val checksumtype_to_value:\n\
                              checksumtype -> Unsigned.uint32"
let enum_type_to_value = "let checksumtype_to_value = function\n\
                          | Md5 -> Unsigned.UInt32.of_int64 0\n\
                          | Sha1 -> Unsigned.UInt32.of_int64 1\n\
                          | Sha256 -> Unsigned.UInt32.of_int64 2\n\
                          | Sha512 -> Unsigned.UInt32.of_int64 3\n\
                          | Sha384 -> Unsigned.UInt32.of_int64 4"

let enum_type_to_value_travis = "let checksumtype_to_value = function\n\
                                 | Md5 -> Unsigned.UInt32.of_int64 0\n\
                                 | Sha1 -> Unsigned.UInt32.of_int64 1\n\
                                 | Sha256 -> Unsigned.UInt32.of_int64 2\n\
                                 | Sha512 -> Unsigned.UInt32.of_int64 3"

let enum_type_view_sig = "val checksumtype : checksumtype typ"

let enum_type_view = "let checksumtype = view \n\
                      ~read:checksumtype_of_value \n\
                      ~write:checksumtype_to_value \n\
                      uint32_t"

let test_append_enum_type test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let values_and_variants = BuilderEnum.get_values_and_variants info in
      BuilderEnum.append_enum_type enum_type_name values_and_variants mli;
      BuilderEnum.append_enum_type enum_type_name values_and_variants ml
  ) in
  enum_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer enum_to_type_travis enum_to_type_travis
      else test_writing test_ctxt info name writer enum_to_type enum_to_type
  )

let test_append_enum_view_reader test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tags = GIEnumInfo.get_storage_type info in
      let (ocaml_type, ctypes_typ) = BuilderUtils.type_tag_to_ctypes_strings tags in
      let values_and_variants = BuilderEnum.get_values_and_variants info in
      BuilderEnum.append_enum_view_reader name enum_type_name ocaml_type values_and_variants (mli, ml)
  ) in
  enum_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer enum_type_of_value_sig enum_type_of_value_travis
      else test_writing test_ctxt info name writer enum_type_of_value_sig enum_type_of_value
  )

let test_append_enum_view_writer test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tags = GIEnumInfo.get_storage_type info in
      let (ocaml_type, ctypes_typ) = BuilderUtils.type_tag_to_ctypes_strings tags in
      let values_and_variants = BuilderEnum.get_values_and_variants info in
      BuilderEnum.append_enum_view_writer name enum_type_name ocaml_type values_and_variants (mli, ml)
  ) in
  enum_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer enum_type_to_value_sig enum_type_to_value_travis
      else test_writing test_ctxt info name writer enum_type_to_value_sig enum_type_to_value
  )

let test_append_enum_view test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tags = GIEnumInfo.get_storage_type info in
      let (ocaml_type, ctypes_typ) = BuilderUtils.type_tag_to_ctypes_strings tags in
      BuilderEnum.append_enum_view enum_type_name ctypes_typ (mli, ml)
  ) in
  enum_test namespace name (fun info ->
      test_writing test_ctxt info name writer enum_type_view_sig enum_type_view
  )

let tests =
  "GObject Introspection BuilderEnum tests" >:::
  [
    "BuilderEnum append enum type" >:: test_append_enum_type;
    "BuilderEnum append enum view reader" >:: test_append_enum_view_reader;
    "BuilderEnum append enum view writer" >:: test_append_enum_view_writer;
    "BuilderEnum append enum view" >:: test_append_enum_view
  ]
