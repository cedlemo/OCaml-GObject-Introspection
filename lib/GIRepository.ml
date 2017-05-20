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
open Foreign
open Conversions

type repository = unit ptr
let repository : repository typ = ptr void

type typelib = unit ptr
let typelib : typelib typ = ptr void

let get_default =
  foreign "g_irepository_get_default" (void @-> returning repository)

let require repo namespace ?version () =
  let require_raw =
  foreign "g_irepository_require"
    (repository @-> string @-> string_opt @-> int @->  void @-> returning (ptr_opt void)) in
  match require_raw repo namespace version 0 () with
  | None -> None
  | Some typelib_ptr -> let typelib_ptr' = coerce (ptr void) (typelib) typelib_ptr in
    Some typelib_ptr'

let get_loaded_namespaces repo =
  let get_loaded_namespaces_raw =
    foreign "g_irepository_get_loaded_namespaces"
      (repository @-> returning carray_of_strings) in
  let c_arr = get_loaded_namespaces_raw repo in
  carray_of_strings_to_list c_arr

let get_dependencies repo namespace =
  let get_dependencies_raw =
    foreign "g_irepository_get_dependencies"
      (repository @-> string @-> returning carray_of_strings) in
  let c_arr = get_dependencies_raw repo namespace in
  carray_of_strings_to_list c_arr

let get_c_prefix =
  foreign "g_irepository_get_c_prefix"
          (repository @-> string @-> returning string)

let get_version =
  foreign "g_irepository_get_version"
          (repository @-> string @-> returning string)

let get_typelib_path =
  foreign "g_irepository_get_typelib_path"
          (repository @-> string @-> returning string)

let enumerate_versions repo namespace =
  let enumerate_versions_raw =
    foreign "g_irepository_enumerate_versions"
      (repository @-> string @-> returning (ptr_opt glist)) in
  match enumerate_versions_raw repo namespace with
  | None -> []
  | Some glist_ptr -> glist_of_strings_to_list glist_ptr

let get_search_path () =
  let get_search_path_raw =
    foreign "g_irepository_get_search_path"
      (void @-> returning (ptr_opt gslist)) in
  match get_search_path_raw () with
  | None -> []
  | Some gslist_ptr -> gslist_of_strings_to_list gslist_ptr

let prepend_search_path =
  foreign "g_irepository_prepend_search_path" (string @-> returning void)

let find_by_name repo namespace name =
  let find_by_name_raw =
    foreign "g_irepository_find_by_name"
      (repository @-> string @-> string @-> returning (ptr_opt GIBaseInfo.baseinfo))
  in match find_by_name_raw repo namespace name with
  | None -> None
  | Some info -> let _ = Gc.finalise (fun i -> GIBaseInfo.base_info_unref i) info
    in Some info

let get_n_infos =
  foreign "g_irepository_get_n_infos"
    (repository @-> string @-> returning int)

let get_info repo namespace n=
  let get_info_raw =
    foreign "g_irepository_get_info"
      (repository @-> string @-> int @-> returning (ptr GIBaseInfo.baseinfo))
  in let max_infos = get_n_infos repo namespace in
  if (n < 0 || n >= max_infos) then raise (Failure "Array Index out of bounds")
  else let info = get_info_raw repo namespace n in
    let _ = Gc.finalise (fun i -> GIBaseInfo.base_info_unref i) info in
    info

let get_shared_library =
  foreign "g_irepository_get_shared_library"
    (repository @-> string @-> returning string_opt)

let prepend_library_path=
  foreign "g_irepository_prepend_library_path"
    (string @-> returning void)

type gtype = int

let find_by_gtype repo gtype =
  let find_by_gtype_raw =
    foreign "g_irepository_find_by_gtype"
      (repository @-> int @-> returning (ptr_opt GIBaseInfo.baseinfo)) in
  match find_by_gtype_raw repo gtype with
  | None -> None
  | Some info -> let _ = Gc.finalise (fun i -> GIBaseInfo.base_info_unref i) info
    in Some info
