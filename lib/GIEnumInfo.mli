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

(** GIEnumInfo — Structs representing an enumeration and its values *)

open Ctypes

(** A GIEnumInfo represents an enumeration and a GIValueInfo struct represents
    a value of an enumeration. The GIEnumInfo contains a set of values and a
    type The GIValueInfo is fetched by calling GIEnumInfo.get_value on a
    GIEnumInfo.*)
type t
val enuminfo : t structure typ

(** Obtain the number of values this enumeration contains. *)
val get_n_values:
  t structure ptr -> int

(** Just cast OCaml Ctypes base info to enum info. *)
val cast_baseinfo_to_enuminfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes enum info to base info *)
val cast_enuminfo_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Return a GIStructInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val enuminfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t form a GIStructInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_enuminfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(*
  TODO : GIValueInfo *	g_enum_info_get_value ()
  TODO : gint	g_enum_info_get_n_methods ()
  TODO : GIFunctionInfo *	g_enum_info_get_method ()
  TODO : GITypeTag	g_enum_info_get_storage_type ()
  TODO : const gchar *	g_enum_info_get_error_domain ()
  TODO : gint64	g_value_info_get_value ()
*)
