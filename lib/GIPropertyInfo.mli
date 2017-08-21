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

(** Obtain the ownership transfer for this property. See GITransfer for more
    information about transfer values. *)
val get_ownership_transfer:
  t structure ptr -> Arg_info.transfer

(** Obtain the type information for the property info . *)
val get_type:
  t structure ptr -> GITypeInfo.t structure ptr

(** Obtain the flags for this property info. See GParamFlags for more
    information about possible flag values. *)
val get_flags:
  t structure ptr -> Arg_info.param_flags

(** Just cast OCaml Ctypes base info to property info. *)
val cast_from_baseinfo:
  Base_info.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes property info to base info *)
val cast_to_baseinfo:
  t structure ptr -> Base_info.t structure ptr

(** Add unref of the C underlying structure whith Gc.finalise. *)
val add_unref_finaliser:
  t structure ptr -> t structure ptr

(** Return a GIPropertyInfo.t from a Base_info.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)
val from_baseinfo:
  Base_info.t structure ptr -> t structure ptr

(** Return a Base_info.t from a GIPropertyInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)
val to_baseinfo:
  t structure ptr -> Base_info.t structure ptr
