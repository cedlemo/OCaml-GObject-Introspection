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

let test_append_ctypes_enum_constants_declarations test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = BuilderEnum.append_ctypes_enum_constants_declarations in
  let mli_content = "" in
  let ml_content = "let md5 = constant \"G_CHECKSUM_MD5\" uint32_t\n\
                    and sha1 = constant \"G_CHECKSUM_SHA1\" uint32_t\n\
                    and sha256 = constant \"G_CHECKSUM_SHA256\" uint32_t\n\
                    and sha512 = constant \"G_CHECKSUM_SHA512\" uint32_t\n\
                    and sha384 = constant \"G_CHECKSUM_SHA384\" uint32_t" in
  let ml_content_travis = "let md5 = constant \"G_CHECKSUM_MD5\" uint32_t\n\
                           and sha1 = constant \"G_CHECKSUM_SHA1\" uint32_t\n\
                           and sha256 = constant \"G_CHECKSUM_SHA256\" uint32_t\n\
                           and sha512 = constant \"G_CHECKSUM_SHA512\" uint32_t" in
  enum_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer mli_content ml_content_travis
      else test_writing test_ctxt info name writer mli_content ml_content
    )

let test_append_ctypes_enum_declaration test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = BuilderEnum.append_ctypes_enum_declaration in
  let mli_content = "" in
  let ml_content = "let checksumtype : [`Md5|`Sha1|`Sha256|`Sha512|`Sha384] typ = enum \"checksumtype\" [\n\
    `Md5, md5;\n\
    `Sha1, sha1;\n\
    `Sha256, sha256;\n\
    `Sha512, sha512;\n\
    `Sha384, sha384\n\
    ]" in
  let ml_content_travis = "let checksumtype : [`Md5|`Sha1|`Sha256|`Sha512] typ = enum \"checksumtype\" [\n\
    `Md5, md5;\n\
    `Sha1, sha1;\n\
    `Sha256, sha256;\n\
    `Sha512, sha512\n\
    ]" in
  enum_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer mli_content ml_content_travis
      else test_writing test_ctxt info name writer mli_content ml_content
    )

let tests =
  "GObject Introspection BuilderEnum tests" >:::
  [
    "BuilderEnum rebuild c identifier for constant" >:: test_rebuild_c_identifier_for_constant;
    "BuilderEnum append ctypes enum constants declarations" >:: test_append_ctypes_enum_constants_declarations;
    "BuilderEnum append ctypes enum declaration" >:: test_append_ctypes_enum_declaration
  ]
