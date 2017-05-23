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

type file = {
  name: string;
  descr : Pervasives.out_channel;
}

type files = {
  ml : file;
  mli : file;
}

type t = {
  repo : GIRepository.repository;
  typelib : GIRepository.typelib;
  namespace : string;
  version : string;
}

let load namespace ?version () =
  let repo = GIRepository.get_default () in
  match GIRepository.require repo namespace ?version:version () with
  | None -> None
  | Some typelib -> let version' = GIRepository.get_version repo namespace in
    Some {repo; typelib; namespace; version = version'}

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

let file_in_create_append_mode name =
  Pervasives.open_out_gen [Open_append; Open_creat] 0o666 name

let generate_sources base_name =
  let name = base_name ^ ".ml" in
  let descr = file_in_create_append_mode name in
  let ml = {name; descr} in
  let name = base_name ^ ".mli" in
  let descr = file_in_create_append_mode name in
  let mli = {name; descr} in
  {ml; mli}

let generate_main_files loader =
  generate_sources loader.namespace

let parse_invalid_info info =
  ()

let parse_function_info info =
  ()

let parse_callback_info info =
  ()

let parse_struct_info info =
  ()

let parse_boxed_info info =
  ()

let parse_enum_info info =
  ()

let parse_flags_info info =
  ()

let parse_object_info info =
  ()

let parse_interface_info info =
  ()

let parse_constant_info info =
  ()

let parse_union_info info =
  ()

let parse_value_info info =
  ()

let parse_signal_info info =
  ()

let parse_vfunc_info info =
  ()

let parse_property_info info =
  ()

let parse_field_info info =
  ()

let parse_arg_info info =
  ()

let parse_type_info info =
  ()

let parse_unresolved_info info =
  ()

let parse loader =
  let n = GIRepository.get_n_infos loader.repo loader.namespace in
  for i = 0 to n - 1 do
    let info = GIRepository.get_info loader.repo loader.namespace i in
    match GIBaseInfo.get_type info with
    | GIBaseInfo.Invalid -> parse_invalid_info info
    | GIBaseInfo.Function -> parse_function_info info
    | GIBaseInfo.Callback -> parse_callback_info info
    | GIBaseInfo.Struct -> parse_struct_info info
    | GIBaseInfo.Boxed -> parse_boxed_info info
    | GIBaseInfo.Enum -> parse_enum_info info
    | GIBaseInfo.Flags -> parse_flags_info info
    | GIBaseInfo.Object -> parse_object_info info
    | GIBaseInfo.Interface -> parse_interface_info info
    | GIBaseInfo.Constant -> parse_constant_info info
    | GIBaseInfo.Invalid_0 -> ()
    | GIBaseInfo.Union -> parse_union_info info
    | GIBaseInfo.Value -> parse_value_info info
    | GIBaseInfo.Signal -> parse_signal_info info
    | GIBaseInfo.Vfunc -> parse_vfunc_info info
    | GIBaseInfo.Property -> parse_property_info info
    | GIBaseInfo.Field -> parse_field_info info
    | GIBaseInfo.Arg -> parse_arg_info info
    | GIBaseInfo.Type -> parse_type_info info
    | GIBaseInfo.Unresolved -> parse_unresolved_info info
  done
