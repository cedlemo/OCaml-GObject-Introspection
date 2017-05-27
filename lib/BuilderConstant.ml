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
open Foreign

let append_constant name info files field field_type printer =
  let (mli, ml) = files in
  let argument = GIConstantInfo.get_value info in
  let value = getf (!@argument) field in
  let lower_name = String.lowercase_ascii name in
  let _ = Printf.fprintf mli "val %s : %s\n" lower_name field_type in
  let str_value = printer value in
  Printf.fprintf ml "let %s = %s\n" lower_name str_value

let append_boolean_constant name info source_files =
  let field = GITypes.v_boolean in
  let field_type = "bool" in
  let printer = string_of_bool in
  append_constant name info source_files field field_type printer

let append_int8_constant name info source_files =
  let field = GITypes.v_int8 in
  let field_type = "int" in
  let printer = string_of_int in
  append_constant name info source_files field field_type printer

let append_uint8_constant name info source_files =
  let field = GITypes.v_uint8 in
  let field_type = "Unsigned.UInt8" in
  let printer = Unsigned.UInt8.to_string in
  append_constant name info source_files field field_type printer

let append_int16_constant name info source_files =
  let field = GITypes.v_int16 in
  let field_type = "int" in
  let printer = string_of_int in
  append_constant name info source_files field field_type printer


