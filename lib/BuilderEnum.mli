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

(** BuilderEnum : regroups all functions needed to parse and generate the
    OCaml code for C enums. Flags are enums for which the constants can be
    OR"ed". *)

open Ctypes
open Foreign

val rebuild_c_identifier_for_constant:
  string -> GIValueInfo.t structure ptr -> string

val append_enum_type:
  string -> (string * string) list -> Pervasives.out_channel -> unit

val append_enum_of_value_fn:
  string -> string -> string -> (string * string) list -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_enum_to_value_fn:
  string -> string -> string -> (string * string) list -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_enum_view:
  string -> string -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val get_values_and_variants:
  GIEnumInfo.t structure ptr -> (string * string) list

val append_ctypes_enum_bindings:
  string -> GIEnumInfo.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_flags_list_to_value_fn:
  string -> string -> string -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_flags_list_of_value_fn:
  string -> string -> string -> (string * string) list -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_flags_view:
  string -> string -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_ctypes_flags_bindings:
  string -> GIEnumInfo.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit
