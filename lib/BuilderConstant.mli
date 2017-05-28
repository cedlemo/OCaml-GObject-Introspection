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

(** BuilderConstant : regroups all functions needed to parse and generate the
    OCaml code for module values. *)

open Ctypes
open Foreign

val append_boolean_constant:
  string -> GIConstantInfo.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_int8_constant:
  string -> GIConstantInfo.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_uint8_constant:
  string -> GIConstantInfo.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_int16_constant:
  string -> GIConstantInfo.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_uint16_constant:
  string -> GIConstantInfo.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_int32_constant:
  string -> GIConstantInfo.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit
