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

(** Obtain the number of methods that this enum type has. *)
val get_n_methods:
  t structure ptr -> int

(** Obtain an enum type method at index n . *)
val get_method:
  t structure ptr -> int -> GIFunctionInfo.t structure ptr

(** Obtain a value for this enumeration. *)
val get_value:
  t structure ptr -> int -> GIValueInfo.t structure ptr option

(** Obtain the string form of the quark for the error domain associated with
    this enum, if any. *)
val get_error_domain:
  t structure ptr -> string option

(** Obtain the tag of the type used for the enum in the C ABI. This will will
    be a signed or unsigned integral type.
    Note that in the current implementation the width of the type is computed
    correctly, but the signed or unsigned nature of the type may not match the
    sign of the type used by the C compiler. *)
val get_storage_type:
  t structure ptr -> GITypes.tag

(** Just cast OCaml Ctypes base info to enum info. *)
val cast_baseinfo_to_enuminfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes enum info to base info *)
val cast_enuminfo_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Return a GIEnumInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val enuminfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t form a GIEnumInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_enuminfo:
  t structure ptr -> GIBaseInfo.t structure ptr
