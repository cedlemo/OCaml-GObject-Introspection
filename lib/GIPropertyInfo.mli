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

(** GIPropertyInfo — Struct representing a property *)

open Ctypes

(** GIPropertyInfo represents a property. A property belongs to either a
    GIObjectInfo or a GIInterfaceInfo.*)
type t
val propertyinfo : t structure typ

(*
  TODO : GParamFlags	g_property_info_get_flags ()
  TODO : GITransfer	g_property_info_get_ownership_transfer ()
  TODO : GITypeInfo *	g_property_info_get_type ()
*)

(** Just cast OCaml Ctypes base info to property info. *)
val cast_baseinfo_to_propertyinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes property info to base info *)
val cast_propertyinfo_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Add unref of the C underlying structure whith Gc.finalise. *)
val add_unref_finaliser_to_property_info:
  t structure ptr -> t structure ptr

(** Return a GIPropertyInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val propertyinfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t from a GIPropertyInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_propertyinfo:
  t structure ptr -> GIBaseInfo.t structure ptr
