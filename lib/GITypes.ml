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

open Ctypes

type tag =
  | Void
  | Boolean
  | Int8
  | Uint8
  | Int16
  | Uint16
  | Int32
  | Uint32
  | Int64
  | Uint64
  | Float
  | Double
  | GType
  | Utf8
  | Filename
  | Array
  | Interface
  | GList
  | GSList
  | GHash
  | Error
  | Unichar

let tag_of_int = function
  | 0 -> Void
  | 1 -> Boolean
  | 2 -> Int8
  | 3 -> Uint8
  | 4 -> Int16
  | 5 -> Uint16
  | 6 -> Int32
  | 7 -> Uint32
  | 8 -> Int64
  | 9 -> Uint64
  | 10 -> Float
  | 11 -> Double
  | 12 -> GType
  | 13 -> Utf8
  | 14 -> Filename
  | 15 -> Array
  | 16 -> Interface
  | 17 -> GList
  | 18 -> GSList
  | 19 -> GHash
  | 20 -> Error
  | 21 -> Unichar
  | value  -> let message = String.concat " " ["GITypes tag value";
                                               string_of_int value;
                                               "should not have been reached"]
    in raise (Failure message)

let string_of_tag = function
  | Void -> "void"
  | Boolean -> "boolean"
  | Int8 -> "int8"
  | Uint8 -> "uint8"
  | Int16 -> "int16"
  | Uint16 -> "uint16"
  | Int32 -> "int32"
  | Uint32 -> "uint32"
  | Int64 -> "int64"
  | Uint64 -> "uint64"
  | Float -> "float"
  | Double -> "double"
  | GType -> "gType"
  | Utf8 -> "utf8"
  | Filename -> "filename"
  | Array -> "array"
  | Interface -> "interface"
  | GList -> "gList"
  | GSList -> "gSList"
  | GHash -> "gHash"
  | Error -> "error"
  | Unichar -> "unichar"

type array_type =
  | C
  | Array
  | Ptr_array
  | Byte_array

let array_type_of_int = function
  | 0 -> C
  | 1 -> Array
  | 2 -> Ptr_array
  | 3 -> Byte_array
  | value  -> let message = String.concat " " ["GITypes array_type value";
                                               string_of_int value;
                                               "should not have been reached"]
    in raise (Failure message)

let string_of_array_type = function
  | C -> "c"
  | Array -> "array"
  | Ptr_array -> "ptr_array"
  | Byte_array -> "byte_array"

type argument_t
let argument : argument_t union typ = union "GIArgument"
let v_boolean = field argument "v_boolean" (bool)
let v_int8 = field argument "v_int8" (int8_t)
let v_uint8 = field argument "v_uint8" (uint8_t)
let v_int16 = field argument "v_int16" (int16_t)
let v_uint16 = field argument "v_uint16" (uint16_t)
let v_int32 = field argument "v_int32" (int32_t)
let v_uint32 = field argument "v_uint32" (uint32_t)
let v_int64 = field argument "v_int64" (int64_t)
let v_uint64 = field argument "v_uint64" (uint64_t)
let v_float = field argument "v_float" (float)
let v_double = field argument "v_double" (double)
let v_short = field argument "v_short" (short)
let v_ushort = field argument "v_ushort" (ushort)
let v_int = field argument "v_int" (int)
let v_uint = field argument "v_uint" (uint)
let v_long = field argument "v_long" (long)
let v_ulong = field argument "v_ulong" (ulong)
let v_ssize = field argument "v_ssize" (PosixTypes.ssize_t)
let v_size = field argument "v_size" (size_t)
let v_string = field argument "v_string" (string)
let v_pointer = field argument "v_pointer" (ptr_opt void)

let () = seal argument
