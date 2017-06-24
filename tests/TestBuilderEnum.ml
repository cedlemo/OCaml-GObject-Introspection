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
  let ml_content = "let _md5 = constant \"G_CHECKSUM_MD5\" uint32_t\n\
                    and _sha1 = constant \"G_CHECKSUM_SHA1\" uint32_t\n\
                    and _sha256 = constant \"G_CHECKSUM_SHA256\" uint32_t\n\
                    and _sha512 = constant \"G_CHECKSUM_SHA512\" uint32_t\n\
                    and _sha384 = constant \"G_CHECKSUM_SHA384\" uint32_t" in
  let ml_content_travis = "let _md5 = constant \"G_CHECKSUM_MD5\" uint32_t\n\
                           and _sha1 = constant \"G_CHECKSUM_SHA1\" uint32_t\n\
                           and _sha256 = constant \"G_CHECKSUM_SHA256\" uint32_t\n\
                           and _sha512 = constant \"G_CHECKSUM_SHA512\" uint32_t" in
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
    `Md5, _md5;\n\
    `Sha1, _sha1;\n\
    `Sha256, _sha256;\n\
    `Sha512, _sha512;\n\
    `Sha384, _sha384\n\
    ] ~unexpected:(fun i -> `Unexpected i)" in
  let ml_content_travis = "let checksumtype : [`Md5|`Sha1|`Sha256|`Sha512] typ = enum \"checksumtype\" [\n\
    `Md5, _md5;\n\
    `Sha1, _sha1;\n\
    `Sha256, _sha256;\n\
    `Sha512, _sha512\n\
    ] ~unexpected:(fun i -> `Unexpected i)" in
  enum_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer mli_content ml_content_travis
      else test_writing test_ctxt info name writer mli_content ml_content
    )

let enum_to_type = "type checksumtype = Md5 | Sha1 | Sha256 | Sha512 | Sha384"
let enum_to_type_travis = "type checksumtype = Md5| Sha1| Sha256| Sha512"
let enum_type_of_value = "let checksumtype_of_unit32 = function\n\
                          | 0 -> Md5\n\
                          | 1 -> Sha1\n\
                          | 2 -> Sha256\n\
                          | 3 -> Sha512\n\
                          | 4 -> Sha384\n\
                          | _ -> raise (Invalid_argument \"Unexpected CheckSumType value\")"

let enum_type_of_value_travis = "let checksumtype_of_unit32 = function\n\
                                 | 0 -> Md5\n\
                                 | 1 -> Sha1\n\
                                 | 2 -> Sha256\n\
                                 | 3 -> Sha512\n\
                                 | _ -> raise (Invalid_argument \"Unexpected CheckSumType value\")"


let enum_type_to_value = "let checksumtype_to_unit32 = function\n\
                          | Md5 -> 0\n\
                          | Sha1 -> 1\n\
                          | Sha256 -> 2\n\
                          | Sha512 -> 3\n\
                          | Sha384 -> 4"

let enum_type_to_value_travis = "let checksumtype_to_unit32 = function\n\
                                 | Md5 -> 0\n\
                                 | Sha1 -> 1\n\
                                 | Sha256 -> 2\n\
                                 | Sha512 -> 3"
let enum_type_view = "let checksumtype = view \n\
                      ~read:checksumtype_of_unit32 \n\
                      ~write:checksumtype_to_unit32 \n\
                      uint32_t"

let test_append_enum_type test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tags = GIEnumInfo.get_storage_type info in
      let (ocaml_type, ctypes_typ) = BuilderUtils.type_tag_to_ctypes_strings tags in
      let values_and_variants = BuilderEnum.get_values_and_variants info in
      BuilderEnum.append_enum_type enum_type_name values_and_variants mli;
      BuilderEnum.append_enum_type enum_type_name values_and_variants ml
  ) in
  enum_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer enum_to_type_travis enum_to_type_travis
      else test_writing test_ctxt info name writer enum_to_type enum_to_type
  )

let tests =
  "GObject Introspection BuilderEnum tests" >:::
  [
    "BuilderEnum rebuild c identifier for constant" >:: test_rebuild_c_identifier_for_constant;
    "BuilderEnum append ctypes enum constants declarations" >:: test_append_ctypes_enum_constants_declarations;
    "BuilderEnum append ctypes enum declaration" >:: test_append_ctypes_enum_declaration;
    "BuilderEnum append enum type" >:: test_append_enum_type
  ]
