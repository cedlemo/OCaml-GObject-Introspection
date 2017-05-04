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

(** The type tag of a GITypeInfo. *)
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
