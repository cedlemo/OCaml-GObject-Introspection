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

(** common types *)

open Ctypes
open Foreign

(** The type tag of a Type_info. *)
type tag =
  | Void (** void *)
  | Boolean (** boolean *)
  | Int8 (** 8-bit signed integer *)
  | Uint8 (** 8-bit unsigned integer *)
  | Int16 (** 16-bit signed integer *)
  | Uint16 (** 16-bit unsigned integer *)
  | Int32 (** 32-bit signed integer *)
  | Uint32 (** 32-bit unsigned integer *)
  | Int64 (** 64-bit signed integer *)
  | Uint64 (** 64-bit unsigned integer *)
  | Float (** float *)
  | Double (** double floating point *)
  | GType (** a GType *)
  | Utf8 (** a UTF-8 encoded string *)
  | Filename (** a filename, encoded in the same encoding as the native filesystem is using. *)
  | Array (** an array *)
  | Interface (** an extended interface object *)
  | GList (** a GList *)
  | GSList (** a GSList *)
  | GHash (** a GHashTable *)
  | Error (** a GError *)
  | Unichar (** Unicode character *)

val tag_of_int:
  int -> tag

val string_of_tag:
  tag -> string

type array_type =
  | C          (** a C array, char[] for instance *)
  | Array      (** a GArray array *)
  | Ptr_array  (** a GPtrArray array *)
  | Byte_array (** a GByteArray array *)

val array_type_of_int:
  int -> array_type

val string_of_array_type:
  array_type -> string

type argument_t
val argument: argument_t union typ
val v_boolean: (bool, argument_t union) field
val v_int8: (int, argument_t union) field
val v_uint8: (Unsigned.uint8, argument_t union) field
val v_int16: (int, argument_t union) field
val v_uint16: (Unsigned.uint16, argument_t union) field
val v_int32: (int32, argument_t union) field
val v_uint32: (Unsigned.uint32, argument_t union) field
val v_int64: (int64, argument_t union) field
val v_uint64: (Unsigned.uint64, argument_t union) field
val v_float: (float, argument_t union) field
val v_double: (float, argument_t union) field
val v_short: (int, argument_t union) field
val v_ushort: (Unsigned.ushort, argument_t union) field
val v_int: (int, argument_t union) field
val v_uint: (Unsigned.uint, argument_t union) field
val v_long: (Signed.long, argument_t union) field
val v_ulong: (Unsigned.ulong, argument_t union) field
val v_ssize: (PosixTypes.ssize_t, argument_t union) field
val v_size: (PosixTypes.size_t, argument_t union) field
val v_string: (string, argument_t union) field
val v_pointer: (unit Ctypes_static.ptr option, argument_t union) field

