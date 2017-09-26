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

let bindings_constant_name name =
  "_" ^ name

let append_constant name info files field field_type printer =
  let open Binding_utils in
  let (mli, ml) = files in
  let argument = Constant_info.get_value info in
  let value = getf (!@argument) field in
  let modified_name = bindings_constant_name name in
  let _ = File.bprintf mli "val %s : %s\n" modified_name field_type in
  let str_value = printer value in
  File.bprintf ml "let %s = %s\n" modified_name str_value

let append_constant_of_32_or_more_bits name info files field field_type type_module printer =
  let open Binding_utils in
  let (mli, ml) = files in
  let argument = Constant_info.get_value info in
  let value = getf (!@argument) field in
  let modified_name = bindings_constant_name name in
  let _ = File.bprintf mli "val %s : %s\n" modified_name field_type in
  let str_value = printer value in
  File.bprintf ml "let %s = %s.of_string \"%s\"\n" modified_name type_module str_value

let append_constant_of_31_or_less_bits name info files field field_type type_module printer =
  let open Binding_utils in
  let (mli, ml) = files in
  let argument = Constant_info.get_value info in
  let value = getf (!@argument) field in
  let modified_name = bindings_constant_name name in
  let _ = File.bprintf mli "val %s : %s\n" modified_name field_type in
  let str_value = printer value in
  File.bprintf ml "let %s = %s.of_int %s\n" modified_name type_module str_value

let append_boolean_constant name info files =
  let field = Types.v_boolean in
  let field_type = "bool" in
  let printer = string_of_bool in
  append_constant name info files field field_type printer

let append_int8_constant name info files =
  let field = Types.v_int8 in
  let field_type = "int" in
  let printer = string_of_int in
  append_constant name info files field field_type printer

let append_uint8_constant name info files =
  let field = Types.v_uint8 in
  let field_type = "Unsigned.uint8" in
  let printer = Unsigned.UInt8.to_string in
  append_constant_of_31_or_less_bits name info files field field_type "Unsigned.UInt8" printer

let append_int16_constant name info files =
  let field = Types.v_int16 in
  let field_type = "int" in
  let printer = string_of_int in
  append_constant name info files field field_type printer

let append_uint16_constant name info files =
  let field = Types.v_uint16 in
  let field_type = "Unsigned.uint16" in
  let printer = Unsigned.UInt16.to_string in
  append_constant_of_31_or_less_bits name info files field field_type "Unsigned.UInt16" printer

let append_int32_constant name info files =
  let field = Types.v_int32 in
  let field_type = "int32" in
  let printer = Int32.to_string in
  append_constant_of_32_or_more_bits name info files field field_type "Int32" printer

let append_uint32_constant name info files =
  let field = Types.v_uint32 in
  let field_type = "Unsigned.uint32" in
  let printer = Unsigned.UInt32.to_string in
  append_constant_of_32_or_more_bits name info files field field_type "Unsigned.UInt32" printer

let append_int64_constant name info (mli, ml) =
  let open Binding_utils in
  let field = Types.v_int64 in
  let field_type = "int64" in
  let argument = Constant_info.get_value info in
  let value = getf (!@argument) field in
  let modified_name = bindings_constant_name name in
  let _ = File.bprintf mli "val %s : %s\n" modified_name field_type in
  let str_value = Int64.to_string value in
  File.bprintf ml "let %s = %sL\n" modified_name str_value

let append_uint64_constant name info files =
  let field = Types.v_uint64 in
  let field_type = "Unsigned.uint64" in
  let printer = Unsigned.UInt64.to_string in
  append_constant_of_32_or_more_bits name info files field field_type "Unsigned.UInt64" printer

let append_float_constant name info files =
  let field = Types.v_float in
  let field_type = "float" in
  let printer = string_of_float in
  append_constant name info files field field_type printer

let append_double_constant name info files =
  let field = Types.v_double in
  let field_type = "float" in
  let printer = string_of_float in
  append_constant name info files field field_type printer

let append_string_constant name info files =
  let field = Types.v_string in
  let field_type = "string" in
  let printer = (fun str -> (("\"" ^ (String.escaped str)) ^ "\"")) in
  append_constant name info files field field_type printer

let parse_constant_info info sources =
  let open Binding_utils in
  match Base_info.get_name info with
  | None -> ()
  | Some name -> let info' = Constant_info.from_baseinfo info in
    let type_info = Constant_info.get_type info' in
    let not_implemented_todo_comments tag (mli, ml) =
      let tag_name = Types.string_of_tag tag in
      File.bprintf mli "(* TODO : constant %s type not implemented for %s *)" name tag_name;
      File.bprintf mli "(* TODO : constant %s type not implemented for %s *)" name tag_name
    in
    let mli = Sources.mli sources in
    let ml = Sources.ml sources in
    let _ = match Type_info.get_tag type_info with
    | Types.Void as tag -> not_implemented_todo_comments tag (mli, ml)
    | Types.Boolean -> append_boolean_constant name info' (mli, ml)
    | Types.Int8 -> append_int8_constant name info' (mli, ml)
    | Types.Uint8 -> append_uint8_constant name info' (mli, ml)
    | Types.Int16 -> append_int16_constant name info' (mli, ml)
    | Types.Uint16 -> append_uint16_constant name info' (mli, ml)
    | Types.Int32 -> append_int32_constant name info' (mli, ml)
    | Types.Uint32 -> append_uint32_constant name info' (mli, ml)
    | Types.Int64 -> append_int64_constant name info' (mli, ml)
    | Types.Uint64 -> append_uint64_constant name info' (mli, ml)
    | Types.Float -> append_float_constant name info' (mli, ml)
    | Types.Double -> append_double_constant name info' (mli, ml)
    | Types.GType as tag -> not_implemented_todo_comments tag (mli, ml)
    | Types.Utf8 -> append_string_constant name info' (mli, ml)
    | Types.Filename as tag -> not_implemented_todo_comments tag (mli, ml)
    | Types.Array as tag -> not_implemented_todo_comments tag (mli, ml)
    | Types.Interface as tag -> not_implemented_todo_comments tag (mli, ml)
    | Types.GList as tag -> not_implemented_todo_comments tag (mli, ml)
    | Types.GSList as tag -> not_implemented_todo_comments tag (mli, ml)
    | Types.GHash as tag -> not_implemented_todo_comments tag (mli, ml)
    | Types.Error as tag -> not_implemented_todo_comments tag (mli, ml)
    | Types.Unichar as tag -> not_implemented_todo_comments tag (mli, ml)
    in
    Sources.write_buffs sources
