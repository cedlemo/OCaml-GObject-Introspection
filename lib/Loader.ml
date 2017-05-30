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

type t = {
  repo : GIRepository.repository;
  typelib : GIRepository.typelib;
  namespace : string;
  version : string;
  build_path: string;
}

let load namespace ?version () =
  let repo = GIRepository.get_default () in
  match GIRepository.require repo namespace ?version:version () with
  | None -> None
  | Some typelib -> let version' = GIRepository.get_version repo namespace in
    Some {repo; typelib; namespace; version = version'; build_path = "./"}

let set_build_path loader path =
  let exists = Sys.file_exists path in
  let is_dir = Sys.is_directory path in
  if exists && is_dir then { loader with build_path = path }
  else let message = "The path does not exist" in
    raise (invalid_arg message)

let get_build_path loader =
  loader.build_path

let get_lib_path loader =
  String.concat "/" [loader.build_path; loader.namespace; "lib"]

let get_namespace loader =
  loader.namespace

let get_version loader =
  loader.version

let generate_dir loader =
  Unix.mkdir loader.namespace 0o640

(* Module Organisation for namespace
 * Namespace.ml
 * Namespace.mli
 *  - get all the functions of the main module
 *  - create include with the other modules generated ?
 * for all struct, unions, enums and object :
 * namepsace_item_name.ml
 * namespace_item_name.mli
 *)

let generate_main_files loader =
  let file_name_pattern = String.concat "/" [loader.build_path; loader.namespace] in
  Builder.generate_sources file_name_pattern

let parse loader =
  let open Builder in
  let main_sources = generate_main_files loader in
  let n = GIRepository.get_n_infos loader.repo loader.namespace in
  for i = 0 to n - 1 do
    let info = GIRepository.get_info loader.repo loader.namespace i in
    match GIBaseInfo.get_type info with
    | GIBaseInfo.Invalid -> Builder.parse_invalid_info info
    | GIBaseInfo.Function -> Builder.parse_function_info info main_sources
    | GIBaseInfo.Callback -> Builder.parse_callback_info info
    | GIBaseInfo.Struct -> Builder.parse_struct_info info
    | GIBaseInfo.Boxed -> Builder.parse_boxed_info info
    | GIBaseInfo.Enum -> Builder.parse_enum_info info
    | GIBaseInfo.Flags -> Builder.parse_flags_info info
    | GIBaseInfo.Object -> Builder.parse_object_info info
    | GIBaseInfo.Interface -> Builder.parse_interface_info info
    | GIBaseInfo.Constant -> Builder.parse_constant_info info main_sources
    | GIBaseInfo.Invalid_0 -> ()
    | GIBaseInfo.Union -> Builder.parse_union_info info
    | GIBaseInfo.Value -> Builder.parse_value_info info
    | GIBaseInfo.Signal -> Builder.parse_signal_info info
    | GIBaseInfo.Vfunc -> Builder.parse_vfunc_info info
    | GIBaseInfo.Property -> Builder.parse_property_info info
    | GIBaseInfo.Field -> Builder.parse_field_info info
    | GIBaseInfo.Arg -> Builder.parse_arg_info info
    | GIBaseInfo.Type -> Builder.parse_type_info info
    | GIBaseInfo.Unresolved -> Builder.parse_unresolved_info info
  done;
  Builder.close_sources main_sources
