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
  repo : Repository.repository;
  typelib : Repository.typelib;
  namespace : string;
  version : string;
  build_path: string;
}

let load namespace ?version () =
  let repo = Repository.get_default () in
  match Repository.require repo namespace ?version:version () with
  | None -> None
  | Some typelib -> let version' = Repository.get_version repo namespace in
    Some {repo; typelib; namespace; version = version'; build_path = "."}

let dir_exists path =
  if not (Sys.file_exists path) then
    false
  else
    if Sys.is_directory path then true
    else false

let set_build_path loader path =
  if dir_exists path then { loader with build_path = path }
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
  Unix.mkdir loader.namespace 0o777

(* Module Organisation for namespace
 * One main module :
 * core.ml
 * core.mli
 *  - contains : constants, enums declarations and module function
 *
 * Secondary modules for all struct, unions, and object :
 * item_name.ml
 * item_name.mli
 *)

let generate_main_module_files loader =
  let file_name_pattern = String.concat "/" [loader.build_path; loader.namespace; "lib"; "core"] in
  Bindings_builder.generate_ctypes_sources file_name_pattern

let generate_secondary_module_files loader name =
  let name' = Bindings_utils.camel_case_to_capitalized_snake_case name in
  let file_name_pattern = (get_lib_path loader ^ "/") ^ name' in
  Bindings_builder.generate_ctypes_sources file_name_pattern

let generate_directories loader =
  let namespace_path = (loader.build_path ^ "/") ^ loader.namespace in
  if not (dir_exists namespace_path) then Unix.mkdir namespace_path 0o777;
  let lib_path = get_lib_path loader in
  if not (dir_exists lib_path) then Unix.mkdir lib_path 0o777

let parse loader
    ?const_parser
    ?enum_parser
    ?flags_parser
    ?struct_parser
    ?union_parser
    () =
  let open Bindings_builder in
  let _ = generate_directories loader in
  let main_sources = generate_main_module_files loader in
  let n = Repository.get_n_infos loader.repo loader.namespace in
  for i = 0 to n - 1 do
    let info = Repository.get_info loader.repo loader.namespace i in
    match Base_info.get_name info with
    | None -> ()
    | Some name ->
      if Base_info.is_deprecated info then
        let coms = Printf.sprintf " !!! DEPRECATED : %s" name in
        Bindings_utils.add_comments main_sources.mli.descr coms
      else
        match Base_info.get_type info with
      | Base_info.Invalid -> Bindings_builder.parse_invalid_info info
      | Base_info.Function -> Bindings_builder.parse_function_info info main_sources
      | Base_info.Callback -> Bindings_builder.parse_callback_info info
      | Base_info.Struct -> let info' = Struct_info.from_baseinfo info in
      if Struct_info.is_gtype_struct info' then ()
      else (
        let sources = generate_secondary_module_files loader name in
        (
          match struct_parser with
            | None -> Bindings_builder.parse_struct_info info sources;
            | Some struct_parser_info -> struct_parser_info info sources;
      );
          Bindings_builder.close_sources sources
        )
            | Base_info.Boxed -> Bindings_builder.parse_boxed_info info
      | Base_info.Enum -> (
        match enum_parser with
          | None -> Bindings_builder.parse_enum_info info main_sources
          | Some enum_parser_fn -> enum_parser_fn info main_sources
      )
          | Base_info.Flags -> (
            match flags_parser with
          | None -> Bindings_builder.parse_flags_info info main_sources
          | Some flags_parser_fn -> flags_parser_fn info main_sources
      )
          | Base_info.Object -> Bindings_builder.parse_object_info info
      | Base_info.Interface -> Bindings_builder.parse_interface_info info
      | Base_info.Constant -> (
        match const_parser with
          | None -> Bindings_builder.parse_constant_info info main_sources
          | Some const_parser_info -> const_parser_info info main_sources
          )
          | Base_info.Invalid_0 -> ()
          | Base_info.Union -> (
            let sources = generate_secondary_module_files loader name in
            let _ = ( match union_parser with
            | None -> Bindings_builder.parse_union_info info sources
            | Some union_parser_fn -> union_parser_fn info sources
          ) in
            Bindings_builder.close_sources sources
            )
            | Base_info.Value -> Bindings_builder.parse_value_info info
      | Base_info.Signal -> Bindings_builder.parse_signal_info info
      | Base_info.Vfunc -> Bindings_builder.parse_vfunc_info info
      | Base_info.Property -> Bindings_builder.parse_property_info info
      | Base_info.Field -> Bindings_builder.parse_field_info info
      | Base_info.Arg -> Bindings_builder.parse_arg_info info
      | Base_info.Type -> Bindings_builder.parse_type_info info
      | Base_info.Unresolved -> Bindings_builder.parse_unresolved_info info
  done;
  Bindings_builder.close_sources main_sources
