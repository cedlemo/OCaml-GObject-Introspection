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

open GIBaseInfo
open Ctypes

(** GIRepository — GObject Introspection repository manager module
  GIRepository is used to manage repositories of namespaces. Namespaces are
  represented on disk by type libraries (.typelib files).
*)

type repository

type typelib

(** Returns the singleton process-global default GIRepository. *)
val get_default:
  unit -> repository

(** Force the namespace namespace_ to be loaded if it isn't already. If
    namespace_ is not loaded, this function will search for a ".typelib" file
    using the repository search path. In addition, a version version of
    namespace may be specified. If version is not specified, the latest will be
    used).
 *)
val require:
  repository -> string option -> string option -> int -> unit -> typelib

(** Return the list of currently loaded namespaces. *)
val get_loaded_namespaces:
  repository -> string list

(** Return an list of all (transitive) versioned dependencies for namespace_ .
    Returned strings are of the form namespace-version.
    Note: namespace_ must have already been loaded using a function such as
    GIRepository.require before calling this function. To get only the immediate
    dependencies for namespace_ , use GIRepository.get_immediate_dependencies.
 *)
val get_dependencies:
  repository -> string option -> string list

(** This function returns the "C prefix", or the C level namespace associated
    with the given introspection namespace. Each C symbol starts with this
    prefix, as well each GType in the library.
    Note: The namespace must have already been loaded using a function such as
    GIRepository.require before calling this function. *)
val get_c_prefix:
  repository -> string option -> string

(** This function returns the loaded version associated with the given
    namespace namespace_ .
    Note: The namespace must have already been loaded using a function such as
    GIRepository.require before calling this function. *)
val get_version:
  repository -> string option -> string

(** If namespace namespace_ is loaded, return the full path to the .typelib
    file it was loaded from. If the typelib for namespace namespace_ was
    included in a shared library, return the special string "<builtin>". *)
val get_typelib_path:
  repository -> string option -> string

(** Obtain an unordered list of versions (either currently loaded or available)
    for namespace_ in this repository . *)
val enumerate_versions:
  repository -> string option -> string list

(** Returns the current search path GIRepository will use when loading typelib
    files. The list is internal to GIRespository and should not be freed, nor
    should its string elements. *)
val get_search_path:
  unit -> string list

(** Prepends directory to the typelib search path. See
    GIRepository.get_search_path. *)
val prepend_search_path:
  string -> unit

(** Searches for a particular entry in a namespace. Before calling this
    function for a particular namespace, you must call GIRepository.require
    once to load the namespace, or otherwise ensure the namespace has already
    been loaded.*)
val find_by_name:
  repository -> string -> string -> baseinfo structure ptr option

(** This function returns the number of metadata entries in given namespace
    namespace_ . The namespace must have already been loaded before calling
    this function. *)
val get_n_infos:
  repository -> string option -> int
(*
   gchar **	g_irepository_get_immediate_dependencies ()
   TODO: gint	g_irepository_get_n_infos ()
   TODO: GIBaseInfo *	g_irepository_get_info ()
   TODO: GOptionGroup *	g_irepository_get_option_group ()
   TODO: void	g_irepository_prepend_library_path ()
   TODO: const char *	g_irepository_load_typelib ()
   gboolean	g_irepository_is_registered ()
   TODO: GITypelib *	g_irepository_require_private ()
   TODO: const gchar *	g_irepository_get_shared_library ()
   TODO: GIBaseInfo *	g_irepository_find_by_gtype ()
   TODO: GIEnumInfo *	g_irepository_find_by_error_domain ()
   gboolean	g_irepository_dump ()
   void	gi_cclosure_marshal_generic ()
*)
