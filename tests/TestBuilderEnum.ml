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
open BuilderUtils

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

let enum_type_of_value = "let checksumtype_of_value v =\n\
                          if v = Unsigned.UInt32.of_int 0 then Md5\n\
                          else if v = Unsigned.UInt32.of_int 1 then Sha1\n\
                          else if v = Unsigned.UInt32.of_int 2 then Sha256\n\
                          else if v = Unsigned.UInt32.of_int 3 then Sha512\n\
                          else if v = Unsigned.UInt32.of_int 4 then Sha384\n\
                          else raise (Invalid_argument \"Unexpected ChecksumType value\")"

let enum_type_of_value_travis = "let checksumtype_of_value v =\n\
                                 if v = Unsigned.UInt32.of_int 0 then Md5\n\
                                 else if v = Unsigned.UInt32.of_int 1 then Sha1\n\
                                 else if v = Unsigned.UInt32.of_int 2 then Sha256\n\
                                 else if v = Unsigned.UInt32.of_int 3 then Sha512\n\
                                 else raise (Invalid_argument \"Unexpected ChecksumType value\")"


let enum_type_to_value_sig = "val checksumtype_to_value:\n\
                              checksumtype -> Unsigned.uint32"
let enum_type_to_value = "let checksumtype_to_value = function\n\
                          | Md5 -> Unsigned.UInt32.of_int 0\n\
                          | Sha1 -> Unsigned.UInt32.of_int 1\n\
                          | Sha256 -> Unsigned.UInt32.of_int 2\n\
                          | Sha512 -> Unsigned.UInt32.of_int 3\n\
                          | Sha384 -> Unsigned.UInt32.of_int 4"

let enum_type_to_value_travis = "let checksumtype_to_value = function\n\
                                 | Md5 -> Unsigned.UInt32.of_int 0\n\
                                 | Sha1 -> Unsigned.UInt32.of_int 1\n\
                                 | Sha256 -> Unsigned.UInt32.of_int 2\n\
                                 | Sha512 -> Unsigned.UInt32.of_int 3"

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

let test_append_enum_of_value_fn test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tag = GIEnumInfo.get_storage_type info in
      match BuilderUtils.type_tag_to_bindings_types tag with
      | BuilderUtils.Not_implemented tag -> assert_equal_string tag "should be implemented"
      | BuilderUtils.Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
        let values_and_variants = BuilderEnum.get_values_and_variants info in
        BuilderEnum.append_enum_of_value_fn name enum_type_name ocaml_type values_and_variants (mli, ml)
  ) in
  enum_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer enum_type_of_value_sig enum_type_of_value_travis
      else test_writing test_ctxt info name writer enum_type_of_value_sig enum_type_of_value
  )

let test_append_enum_to_value_fn test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tag = GIEnumInfo.get_storage_type info in
      match BuilderUtils.type_tag_to_bindings_types tag with
      | BuilderUtils.Not_implemented tag -> assert_equal_string tag "should be implemented"
      | BuilderUtils.Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
        let values_and_variants = BuilderEnum.get_values_and_variants info in
        BuilderEnum.append_enum_to_value_fn name enum_type_name ocaml_type values_and_variants (mli, ml)
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
      let tag = GIEnumInfo.get_storage_type info in
      match BuilderUtils.type_tag_to_bindings_types tag with
      | BuilderUtils.Not_implemented tag -> assert_equal_string tag "should be implemented"
      | BuilderUtils.Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
        BuilderEnum.append_enum_view enum_type_name ctypes_typ (mli, ml)
  ) in
  enum_test namespace name (fun info ->
      test_writing test_ctxt info name writer enum_type_view_sig enum_type_view
  )

let flags_to_type = "type optionflags = None | Hidden | In_main | Reverse | No_arg | Filename | Optional_arg | Noalias\n\
                     type optionflags_list = optionflags list"
let flags_to_type_travis = "type optionflags = Hidden | In_main | Reverse | No_arg | Filename | Optional_arg | Noalias\n\
                            type optionflags_list = optionflags list"

let flags_of_value_sig = "val optionflags_of_value:\n\
                          Unsigned.uint32 -> optionflags"
let flags_of_value = "let optionflags_of_value v =\n\
                      if v = Unsigned.UInt32.of_int 0 then None\n\
                      else if v = Unsigned.UInt32.of_int 1 then Hidden\n\
                      else if v = Unsigned.UInt32.of_int 2 then In_main\n\
                      else if v = Unsigned.UInt32.of_int 4 then Reverse\n\
                      else if v = Unsigned.UInt32.of_int 8 then No_arg\n\
                      else if v = Unsigned.UInt32.of_int 16 then Filename\n\
                      else if v = Unsigned.UInt32.of_int 32 then Optional_arg\n\
                      else if v = Unsigned.UInt32.of_int 64 then Noalias\n\
                      else raise (Invalid_argument \"Unexpected OptionFlags value\")"

let flags_of_value_travis = "let optionflags_of_value v =\n\
                             if v = Unsigned.UInt32.of_int 1 then Hidden\n\
                             else if v = Unsigned.UInt32.of_int 2 then In_main\n\
                             else if v = Unsigned.UInt32.of_int 4 then Reverse\n\
                             else if v = Unsigned.UInt32.of_int 8 then No_arg\n\
                             else if v = Unsigned.UInt32.of_int 16 then Filename\n\
                             else if v = Unsigned.UInt32.of_int 32 then Optional_arg\n\
                             else if v = Unsigned.UInt32.of_int 64 then Noalias\n\
                             else raise (Invalid_argument \"Unexpected OptionFlags value\")"

let flags_to_value_sig = "val optionflags_to_value:\n\
                          optionflags -> Unsigned.uint32"
let flags_to_value = "let optionflags_to_value = function\n\
                      | None -> Unsigned.UInt32.of_int 0\n\
                      | Hidden -> Unsigned.UInt32.of_int 1\n\
                      | In_main -> Unsigned.UInt32.of_int 2\n\
                      | Reverse -> Unsigned.UInt32.of_int 4\n\
                      | No_arg -> Unsigned.UInt32.of_int 8\n\
                      | Filename -> Unsigned.UInt32.of_int 16\n\
                      | Optional_arg -> Unsigned.UInt32.of_int 32\n\
                      | Noalias -> Unsigned.UInt32.of_int 64"

let flags_to_value_travis = "let optionflags_to_value = function\n\
                             | Hidden -> Unsigned.UInt32.of_int 1\n\
                             | In_main -> Unsigned.UInt32.of_int 2\n\
                             | Reverse -> Unsigned.UInt32.of_int 4\n\
                             | No_arg -> Unsigned.UInt32.of_int 8\n\
                             | Filename -> Unsigned.UInt32.of_int 16\n\
                             | Optional_arg -> Unsigned.UInt32.of_int 32\n\
                             | Noalias -> Unsigned.UInt32.of_int 64"


let flags_type_list_to_value_sig = "val optionflags_list_to_value:\n\
                                    optionflags_list -> Unsigned.uint32"
let flags_type_list_to_value = "let optionflags_list_to_value flags =\n\
                                  let open Unsigned.UInt32 in\n\
                                  let rec logor_flags l acc =\n\
                                  match l with\n\
                                  | [] -> acc\n\
                                  | f :: q -> let v = optionflags_to_value f in\n\
                                    let acc' = logor acc v in\n\
                                    logor_flags q acc'\n\
                                  in\n\
                                  logor_flags flags zero"
let flags_type_list_of_value_sig = "val optionflags_list_of_value:\n\
                                    Unsigned.uint32 -> optionflags_list"
let flags_type_list_of_value = "let optionflags_list_of_value v =\n\
                                let open Unsigned.UInt32 in\n\
                                let flags = [] in\n\
                                if ((logand v (of_int 0 )) != zero) then ignore ( None :: flags );\n\
                                if ((logand v (of_int 1 )) != zero) then ignore ( Hidden :: flags );\n\
                                if ((logand v (of_int 2 )) != zero) then ignore ( In_main :: flags );\n\
                                if ((logand v (of_int 4 )) != zero) then ignore ( Reverse :: flags );\n\
                                if ((logand v (of_int 8 )) != zero) then ignore ( No_arg :: flags );\n\
                                if ((logand v (of_int 16 )) != zero) then ignore ( Filename :: flags );\n\
                                if ((logand v (of_int 32 )) != zero) then ignore ( Optional_arg :: flags );\n\
                                if ((logand v (of_int 64 )) != zero) then ignore ( Noalias :: flags );\n\
                                flags"

let flags_type_list_of_value_travis = "let optionflags_list_of_value v =\n\
                                       let open Unsigned.UInt32 in\n\
                                       let flags = [] in\n\
                                       if ((logand v (of_int 1 )) != zero) then ignore ( Hidden :: flags );\n\
                                       if ((logand v (of_int 2 )) != zero) then ignore ( In_main :: flags );\n\
                                       if ((logand v (of_int 4 )) != zero) then ignore ( Reverse :: flags );\n\
                                       if ((logand v (of_int 8 )) != zero) then ignore ( No_arg :: flags );\n\
                                       if ((logand v (of_int 16 )) != zero) then ignore ( Filename :: flags );\n\
                                       if ((logand v (of_int 32 )) != zero) then ignore ( Optional_arg :: flags );\n\
                                       if ((logand v (of_int 64 )) != zero) then ignore ( Noalias :: flags );\n\
                                       flags"

let flags_type_view_sig = "val optionflags_list : optionflags_list typ"
let flags_type_view = "let optionflags_list = view\n\
                       ~read:optionflags_list_of_value\n\
                       ~write:optionflags_list_to_value\n\
                       uint32_t"
let get_flags_info namespace enum_name =
  match GIRepository.find_by_name repo namespace enum_name with
  | None -> None
  | Some (base_info) ->
    match GIBaseInfo.get_type base_info with
    | GIBaseInfo.Flags -> let info = GIEnumInfo.from_baseinfo base_info in
      Some info
    | _ -> None

let flags_test namespace enum_name fn =
  match get_flags_info namespace enum_name with
  | None -> assert_equal_string enum_name "No base info found"
  | Some (info) -> fn info

let test_append_flags_types test_ctxt =
  let namespace = "GLib" in
  let name = "OptionFlags" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let values_and_variants = BuilderEnum.get_values_and_variants info in
      BuilderEnum.append_flags_types enum_type_name values_and_variants mli;
      BuilderEnum.append_flags_types enum_type_name values_and_variants ml
  ) in
  flags_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer flags_to_type_travis flags_to_type_travis
      else test_writing test_ctxt info name writer flags_to_type flags_to_type
  )

let test_append_enum_flags_of_value_fn test_ctxt =
  let namespace = "GLib" in
  let name = "OptionFlags" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tag = GIEnumInfo.get_storage_type info in
      match BuilderUtils.type_tag_to_bindings_types tag with
      | BuilderUtils.Not_implemented tag -> assert_equal_string tag "should be implemented"
      | BuilderUtils.Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
        let values_and_variants = BuilderEnum.get_values_and_variants info in
        BuilderEnum.append_enum_of_value_fn name enum_type_name ocaml_type values_and_variants (mli, ml)
  ) in
  flags_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer flags_of_value_sig flags_of_value_travis
      else test_writing test_ctxt info name writer flags_of_value_sig flags_of_value
  )

let test_append_enum_flags_to_value_fn test_ctxt =
  let namespace = "GLib" in
  let name = "OptionFlags" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tag = GIEnumInfo.get_storage_type info in
      match BuilderUtils.type_tag_to_bindings_types tag with
      | BuilderUtils.Not_implemented tag -> assert_equal_string tag "should be implemented"
      | BuilderUtils.Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
        let values_and_variants = BuilderEnum.get_values_and_variants info in
        BuilderEnum.append_enum_to_value_fn name enum_type_name ocaml_type values_and_variants (mli, ml)
  ) in
  flags_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer flags_to_value_sig flags_to_value_travis
      else test_writing test_ctxt info name writer flags_to_value_sig flags_to_value
)

let test_append_enum_flags_list_to_value_fn test_ctxt =
  let namespace = "GLib" in
  let name = "OptionFlags" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tag = GIEnumInfo.get_storage_type info in
      match BuilderUtils.type_tag_to_bindings_types tag with
      | BuilderUtils.Not_implemented tag -> assert_equal_string tag "should be implemented"
      | BuilderUtils.Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
        BuilderEnum.append_flags_list_to_value_fn name enum_type_name ocaml_type (mli, ml)
  ) in
  flags_test namespace name (fun info ->
      test_writing test_ctxt info name writer flags_type_list_to_value_sig flags_type_list_to_value
  )

let test_append_enum_flags_list_of_value_fn test_ctxt =
  let namespace = "GLib" in
  let name = "OptionFlags" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tag = GIEnumInfo.get_storage_type info in
      match BuilderUtils.type_tag_to_bindings_types tag with
      | BuilderUtils.Not_implemented tag -> assert_equal_string tag "should be implemented"
      | BuilderUtils.Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
        let values_and_variants = BuilderEnum.get_values_and_variants info in
        BuilderEnum.append_flags_list_of_value_fn name enum_type_name ocaml_type values_and_variants (mli, ml)
  ) in
  flags_test namespace name (fun info ->
      if is_travis then test_writing test_ctxt info name writer flags_type_list_of_value_sig flags_type_list_of_value_travis
      else test_writing test_ctxt info name writer flags_type_list_of_value_sig flags_type_list_of_value
  )

let test_append_flags_view test_ctxt =
  let namespace = "GLib" in
  let name = "ChecksumType" in
  let writer = (fun name info (mli, ml) ->
      let enum_type_name = String.lowercase_ascii name in
      let tag = GIEnumInfo.get_storage_type info in
      match BuilderUtils.type_tag_to_bindings_types tag with
      | BuilderUtils.Not_implemented tag -> assert_equal_string tag "should be implemented"
      | BuilderUtils.Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
        BuilderEnum.append_flags_view enum_type_name ctypes_typ (mli, ml)
  ) in
  enum_test namespace name (fun info ->
      test_writing test_ctxt info name writer flags_type_view_sig flags_type_view
  )


let tests =
  "GObject Introspection BuilderEnum tests" >:::
  [
    "BuilderEnum append enum type" >:: test_append_enum_type;
    "BuilderEnum append enum view reader" >:: test_append_enum_of_value_fn;
    "BuilderEnum append enum view writer" >:: test_append_enum_to_value_fn;
    "BuilderEnum append enum view" >:: test_append_enum_view;
    "BuilderEnum append enum flags type" >:: test_append_flags_types;
    "BuilderEnum append enum flags of value" >:: test_append_enum_flags_of_value_fn;
    "BuilderEnum append enum flags to value" >:: test_append_enum_flags_to_value_fn;
    "BuilderEnum append enum flags list to value" >:: test_append_enum_flags_list_to_value_fn;
    "BuilderEnum append enum flags list of value" >:: test_append_enum_flags_list_of_value_fn
  ]
