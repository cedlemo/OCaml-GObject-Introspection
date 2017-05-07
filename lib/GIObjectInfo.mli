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

(** GIObjectInfo — Struct representing a GObject *)

open Ctypes

(** GIObjectInfo represents a GObject. This doesn't represent a specific
    instance of a GObject, instead this represent the object type (eg class).
    A GObject has methods, fields, properties, signals, interfaces, constants
    and virtual functions.*)
type t
val objectinfo : t structure typ

(** Just cast OCaml Ctypes base info to object info. *)
val cast_baseinfo_to_objectinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes object info to base info *)
val cast_objectinfo_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Return a GIObjectInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val objectinfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t from a GIObjectInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_objectinfo:
  t structure ptr -> GIBaseInfo.t structure ptr
