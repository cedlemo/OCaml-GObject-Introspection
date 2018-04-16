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

type repository = unit ptr option
let repository : repository typ = ptr_opt void

type typelib = unit ptr
let typelib : typelib typ = ptr void

type gerror_t
let gerror : gerror_t structure typ = structure "GError"
let f_domain = field gerror "domain" (uint32_t)
let f_code = field gerror "code" (int32_t)
let f_message = field gerror "message" (string)
let _ = seal gerror

let get_default =
  foreign "g_irepository_get_default" (void @-> returning repository)

let require ?repository namespace ?version () =
  let require_raw =
  foreign "g_irepository_require"
    (repository @-> string @-> string_opt @-> int @->  ptr (ptr gerror) @-> returning (ptr_opt void)) in
  let error_addr = allocate_n (ptr gerror) 1 in
  let repo = match repository with None -> None | Some r -> r in
  match require_raw ~repository:repo namespace version 0 error_addr with
  | None -> Error "Unable to get anything"
  | Some typelib_ptr ->
      match coerce (ptr gerror) (ptr_opt gerror) (!@error_addr) with
      | None ->let typelib_ptr' = coerce (ptr void) (typelib) typelib_ptr in
          Ok typelib_ptr'
      | Some error -> Error (getf !@error f_message)

let get_loaded_namespaces ?repository () =
  let get_loaded_namespaces_raw =
    foreign "g_irepository_get_loaded_namespaces"
      (repository @-> returning carray_of_strings) in
  let repo = match repository with None -> None | Some r -> r in
  let c_arr = get_loaded_namespaces_raw ~repository:repo in
  carray_of_strings_to_list c_arr

let get_dependencies ?repository namespace =
  let get_dependencies_raw =
    foreign "g_irepository_get_dependencies"
      (repository @-> string @-> returning carray_of_strings) in
  let repo = match repository with None -> None | Some r -> r in
  let c_arr = get_dependencies_raw ~repository:repo namespace in
  carray_of_strings_to_list c_arr

let get_c_prefix ?repository namespace =
  let get_c_prefix_raw =
    foreign "g_irepository_get_c_prefix"
            (repository @-> string @-> returning string) in
  let repo = match repository with None -> None | Some r -> r in
  get_c_prefix_raw ~repository:repo namespace

let get_version ?repository namespace =
  let get_version_raw =
    foreign "g_irepository_get_version" (repository @-> string @-> returning string)
  in
  let repo = match repository with None -> None | Some r -> r in
  get_version_raw ~repository:repo namespace

let get_typelib_path ?repository namespace =
  let get_typelib_path_raw =
    foreign "g_irepository_get_typelib_path" (repository @-> string @-> returning string)
  in
  let repo = match repository with None -> None | Some r -> r in
  get_version_raw ~repository:repo namespace

let enumerate_versions ?repository namespace =
  let enumerate_versions_raw =
    foreign "g_irepository_enumerate_versions"
      (repository @-> string @-> returning (ptr_opt glist)) in
  let repo = match repository with None -> None | Some r -> r in
  match enumerate_versions_raw ~repository:repo namespace with
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

let find_by_name ?repository namespace name =
  let find_by_name_raw =
    foreign "g_irepository_find_by_name"
      (repository @-> string @-> string @-> returning (ptr_opt Base_info.baseinfo))
  let repo = match repository with None -> None | Some r -> r in
  in match find_by_name_raw ~repository:repo namespace name with
  | None -> None
  | Some info -> let _ = Gc.finalise (fun i -> Base_info.base_info_unref i) info
    in Some info

let get_n_infos ?repository namespace =
  let get_n_infos_raw =
    foreign "g_irepository_get_n_infos" (repository @-> string @-> returning int)
  in
  let repo = match repository with None -> None | Some r -> r in
  get_n_infos_raw ~repository:repo namespace

let get_info ?repository namespace n=
  let get_info_raw =
    foreign "g_irepository_get_info"
      (repository @-> string @-> int @-> returning (ptr Base_info.baseinfo))
  let repo = match repository with None -> None | Some r -> r in
  in let max_infos = get_n_infos repo namespace in
  if (n < 0 || n >= max_infos) then raise (Failure "Array Index out of bounds")
  else let info = get_info_raw ~repository:repo namespace n in
    let _ = Gc.finalise (fun i -> Base_info.base_info_unref i) info in
    info

let get_shared_library ?repository namespace =
  let get_shared_library_raw =
    foreign "g_irepository_get_shared_library" (repository @-> string @-> returning string_opt)
  in

let prepend_library_path=
  foreign "g_irepository_prepend_library_path"
    (string @-> returning void)

type gtype = int64
let gtype : gtype typ = int64_t

let find_by_gtype ?repository gtyp =
  let find_by_gtype_raw =
    foreign "g_irepository_find_by_gtype"
      (repository @-> gtype @-> returning (ptr_opt Base_info.baseinfo)) in
  let repo = match repository with None -> None | Some r -> r in
  match find_by_gtype_raw repo gtyp with
  | None -> None
  | Some info -> let _ = Gc.finalise (fun i -> Base_info.base_info_unref i) info
    in Some info
