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

(** GIBaseInfo — Base struct for all GITypelib structs *)
open Ctypes

(** GIBaseInfo is the common base struct of all other *Info structs accessible
    through the GIRepository API. All other structs can be casted to a
    GIBaseInfo *)
type baseinfo
val baseinfo : baseinfo structure typ

(** Increases the reference count of underlying GIBaseInfo *info. *)
val ref:
  baseinfo structure ptr -> baseinfo structure ptr

(** Decreases the reference count of underlying GIBaseInfo *info . When its
    reference count drops to 0, the info is freed. *)
val unref:
  baseinfo structure ptr -> unit

(** Obtain the name of the info . What the name represents depends on the
    GIInfoType of the info . For instance for GIFunctionInfo it is the name of
    the function.*)
val get_name:
  baseinfo structure ptr -> string option

(** Compare two GIBaseInfo.
    Using pointer comparison is not practical since many functions return
    different instances of GIBaseInfo that refers to the same part of the
    TypeLib; use this function instead to do GIBaseInfo comparisons. *)
val equal:
  baseinfo structure ptr -> baseinfo structure ptr -> bool

(** Obtain the namespace of info *)
val get_namespace:
  baseinfo structure ptr -> string

(** Obtain whether the info is represents a metadata which is deprecated or not. *)
val is_deprecated:
  baseinfo structure ptr -> bool

(*
  GIBaseInfo *	g_info_new ()
  TODO : GIInfoType	g_base_info_get_type ()
  TODO : GITypelib *	g_base_info_get_typelib ()
  TODO : const gchar *	g_base_info_get_attribute ()
  TODO : gboolean	g_base_info_iterate_attributes ()
  TODO : GIBaseInfo *	g_base_info_get_container ()
*)
