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

(** Builder : module that will build OCaml binding with CTypes from the
    GObject-Introspection information. *)

open Ctypes
open Foreign

(** A simple file type that contains the name and the file descriptor. *)
type file = {
  name: string;
  descr : Pervasives.out_channel;
}

(** A type that for OCaml source file. The ml field is for the source code
    file and the mli field is for the header file.*)
type files = {
  ml : file;
  mli : file;
}

(** Helper that use the argument as a base name in order to create two files
    one with the .ml extension and one with the .mli extension in create and
    append mode. The name and the file descriptor are returned in a files type. *)
val generate_sources:
  string -> files

(** Close the two file descriptors in a files type *)
val close_sources:
  files -> unit

val parse_invalid_info :
  GIBaseInfo.t structure ptr -> unit

val parse_function_info :
  GIBaseInfo.t structure ptr -> files -> unit

val parse_callback_info :
  GIBaseInfo.t structure ptr -> unit

val parse_struct_info :
  GIBaseInfo.t structure ptr -> files -> unit

val parse_boxed_info :
  GIBaseInfo.t structure ptr -> unit

val parse_enum_info :
  GIBaseInfo.t structure ptr -> files -> unit

val parse_flags_info :
  GIBaseInfo.t structure ptr -> unit

val parse_object_info :
  GIBaseInfo.t structure ptr -> unit

val parse_interface_info :
  GIBaseInfo.t structure ptr -> unit

(** Use a GIConstantInfo in order to generate code with Ctypes. C Constants
    will be written as module values. *)
val parse_constant_info :
  GIBaseInfo.t structure ptr -> files -> unit

val parse_union_info :
  GIBaseInfo.t structure ptr -> files -> unit

val parse_value_info :
  GIBaseInfo.t structure ptr -> unit

val parse_signal_info :
  GIBaseInfo.t structure ptr -> unit

val parse_vfunc_info :
  GIBaseInfo.t structure ptr -> unit

val parse_property_info :
  GIBaseInfo.t structure ptr -> unit

val parse_field_info :
  GIBaseInfo.t structure ptr -> unit

val parse_arg_info :
  GIBaseInfo.t structure ptr -> unit

val parse_type_info :
  GIBaseInfo.t structure ptr -> unit

val parse_unresolved_info :
  GIBaseInfo.t structure ptr -> unit
