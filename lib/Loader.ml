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

open Ctypes

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

let generate_module_files loader name =
  let module_name = Lexer.snake_case name in
  let f_name_pattern = String.concat "/" [get_lib_path loader; module_name] in
  Binding_utils.Sources.create_ctypes f_name_pattern

let generate_directories loader =
  let namespace_path = (loader.build_path ^ "/") ^ loader.namespace in
  if not (dir_exists namespace_path) then Unix.mkdir namespace_path 0o777;
  let lib_path = get_lib_path loader in
  if not (dir_exists lib_path) then Unix.mkdir lib_path 0o777

type gi_info = { base_name : string;
                 info : Base_info.t structure ptr;
                 loader : t;
                 sources : Binding_utils.Sources.t }

let generate_bindings gi_info const_parser
                                             enum_parser
                                             flags_parser
                                             struct_parser
                                             union_parser
                                             skip =
        match Base_info.get_type gi_info.info with
        | Base_info.Function ->
            Bind_function.parse_function_info gi_info.info gi_info.sources
        | Base_info.Struct ->
            let info' = Struct_info.from_baseinfo gi_info.info in
            if Struct_info.is_gtype_struct info' then ()
            else (
              let sources = generate_module_files gi_info.loader gi_info.base_name in (
              match struct_parser with
              | None -> Bind_struct.parse_struct_info gi_info.info sources;
              | Some struct_parser_info -> struct_parser_info gi_info.info sources;
              );
              Binding_utils.Sources.close sources
          )
        | Base_info.Enum -> (
            let sources = generate_module_files gi_info.loader gi_info.base_name in (
            match enum_parser with
            | None -> Bind_enum.parse_enum_info gi_info.info sources
            | Some enum_parser_fn -> enum_parser_fn gi_info.info sources;
              Binding_utils.Sources.close sources
          )
        )
        | Base_info.Flags -> (
            let sources = generate_module_files gi_info.loader gi_info.base_name in (
            match flags_parser with
            | None -> Bind_enum.parse_flags_info gi_info.info sources
            | Some flags_parser_fn -> flags_parser_fn gi_info.info sources;
              Binding_utils.Sources.close sources
          )
        )
        | Base_info.Constant -> (
           match const_parser with
          | None -> Bind_constant.parse_constant_info gi_info.info gi_info.sources
          | Some const_parser_info -> const_parser_info gi_info.info gi_info.sources
        )
        | Base_info.Union -> (
          let sources = generate_module_files gi_info.loader gi_info.base_name in
          let _ = ( match union_parser with
            | None -> Bind_union.parse_union_info gi_info.info sources
            | Some union_parser_fn -> union_parser_fn gi_info.info sources
          ) in
          Binding_utils.Sources.close sources
        )
        | Base_info.Callback -> ()
        | Base_info.Invalid -> ()
        | Base_info.Value -> ()
        | Base_info.Signal -> ()
        | Base_info.Vfunc -> ()
        | Base_info.Property -> ()
        | Base_info.Field -> ()
        | Base_info.Arg -> ()
        | Base_info.Type -> ()
        | Base_info.Unresolved -> ()
        | Base_info.Object -> ()
        | Base_info.Invalid_0 -> ()
        | Base_info.Interface -> ()
        | Base_info.Boxed -> ()

let parse loader
    ?const_parser
    ?enum_parser
    ?flags_parser
    ?struct_parser
    ?union_parser
    ?(skip = [])
    () =
  let open Binding_utils in
  let _ = generate_directories loader in
  let main_sources = generate_module_files loader "Core" in
  let n = Repository.get_n_infos loader.repo loader.namespace in
  for i = 0 to n - 1 do
    let info = Repository.get_info loader.repo loader.namespace i in
    match Base_info.get_name info with
    | None -> ()
    | Some name ->
      if Base_info.is_deprecated info then Sources.add_deprecated main_sources name
      else (
        if match_one_of name skip then Sources.add_skipped main_sources name
        else
          let gi_info = { base_name = name;
                          info = info;
                          loader = loader;
                          sources = main_sources } in
          generate_bindings gi_info const_parser
                                    enum_parser
                                    flags_parser
                                    struct_parser
                                    union_parser
                                    skip
      )
  done;
  Binding_utils.Sources.close main_sources
