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

(** Bind_constant : regroups all functions needed to parse and generate the
    OCaml code for module values. *)

open Ctypes
open Foreign

(** Returns the OCaml constant name from the C constant name. It just prepend
    "c_" to the C constant name.*)
val binding_constant_name:
  string -> string

val append_boolean_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_int8_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_uint8_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_int16_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_uint16_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_int32_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_uint32_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_int64_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_uint64_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_float_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_double_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

val append_string_constant:
  string -> Constant_info.t structure ptr -> (Binding_utils.File.t * Binding_utils.File.t) -> unit

(** Use a Constant_info in order to generate code with Ctypes. C Constants
    will be written as module values. *)
val parse_constant_info :
  Base_info.t structure ptr -> Binding_utils.Sources.t -> unit
