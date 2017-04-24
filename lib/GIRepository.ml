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

(** GIRepository — GObject Introspection repository manager module
  GIRepository is used to manage repositories of namespaces. Namespaces are
  represented on disk by type libraries (.typelib files).
*)

open Ctypes
open Foreign
open Conversions

type repository = unit ptr
let repository : repository typ = ptr void

type typelib = unit ptr
let typelib : typelib typ = ptr void

(** Returns the singleton process-global default GIRepository. *)
let get_default =
  foreign "g_irepository_get_default" (void @-> returning repository)

(** Force the namespace namespace_ to be loaded if it isn't already. If
    namespace_ is not loaded, this function will search for a ".typelib" file
    using the repository search path. In addition, a version version of
    namespace may be specified. If version is not specified, the latest will be
    used).
 *)
let require =
  foreign "g_irepository_require"
    (repository @-> string_opt @-> string_opt @-> int @->  void @-> returning typelib)

(** Return the list of currently loaded namespaces. *)
let get_loaded_namespaces repo =
  let get_loaded_namespaces_raw =
    foreign "g_irepository_get_loaded_namespaces"
      (repository @-> returning carray_of_strings) in
  let c_arr = get_loaded_namespaces_raw repo in
  carray_of_strings_to_list c_arr

(** Return an list of all (transitive) versioned dependencies for namespace_ .
    Returned strings are of the form namespace-version.
    Note: namespace_ must have already been loaded using a function such as
    GIRepository.require before calling this function. To get only the immediate
    dependencies for namespace_ , use GIRepository.get_immediate_dependencies.
 *)
let get_dependencies repo namespace =
  let get_dependencies_raw =
    foreign "g_irepository_get_dependencies"
      (repository @-> string_opt @-> returning carray_of_strings) in
  let c_arr = get_dependencies_raw repo namespace in
  carray_of_strings_to_list c_arr
