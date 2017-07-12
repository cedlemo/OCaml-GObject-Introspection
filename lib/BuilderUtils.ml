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

type type_strings = { ocaml : string;
                      ctypes : string }

type bindings_types = Not_implemented of string | Types of type_strings

let type_tag_to_bindings_types = function
  | GITypes.Void -> Types { ocaml = "unit"; ctypes = "void" }
  | GITypes.Boolean -> Types { ocaml = "bool"; ctypes = "bool"}
  | GITypes.Int8 -> Types { ocaml = "int"; ctypes = "int8_t"}
  | GITypes.Uint8 -> Types { ocaml = "Unsigned.uint8"; ctypes = "uint8_t"}
  | GITypes.Int16 -> Types { ocaml = "int"; ctypes = "int16_t"}
  | GITypes.Uint16 -> Types { ocaml = "Unsigned.uint16"; ctypes = "uint16_t"}
  | GITypes.Int32 -> Types { ocaml = "int32"; ctypes = "int32_t"}
  | GITypes.Uint32 -> Types { ocaml = "Unsigned.uint32"; ctypes = "uint32_t"}
  | GITypes.Int64 -> Types { ocaml = "int64"; ctypes = "int64_t"}
  | GITypes.Uint64 -> Types { ocaml = "Unsigned.uint64"; ctypes = "uint64_t"}
  | GITypes.Float -> Types { ocaml = "float"; ctypes = "float"}
  | GITypes.Double -> Types { ocaml = "float"; ctypes = "double"}
  | GITypes.GType as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.Utf8 as tag-> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.Filename as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.Array as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.Interface as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.GList as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.GSList as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.GHash as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.Error as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.Unichar as tag -> Not_implemented (GITypes.string_of_tag tag)

let type_info_to_bindings_types type_info =
  match GITypeInfo.get_tag type_info with
  | GITypes.Void -> Types { ocaml = "unit"; ctypes = "void" }
  | GITypes.Boolean -> Types { ocaml = "bool"; ctypes = "bool"}
  | GITypes.Int8 -> Types { ocaml = "int"; ctypes = "int8_t"}
  | GITypes.Uint8 -> Types { ocaml = "Unsigned.uint8"; ctypes = "uint8_t"}
  | GITypes.Int16 -> Types { ocaml = "int"; ctypes = "int16_t"}
  | GITypes.Uint16 -> Types { ocaml = "Unsigned.uint16"; ctypes = "uint16_t"}
  | GITypes.Int32 -> Types { ocaml = "int32"; ctypes = "int32_t"}
  | GITypes.Uint32 -> Types { ocaml = "Unsigned.uint32"; ctypes = "uint32_t"}
  | GITypes.Int64 -> Types { ocaml = "int64"; ctypes = "int64_t"}
  | GITypes.Uint64 -> Types { ocaml = "Unsigned.uint64"; ctypes = "uint64_t"}
  | GITypes.Float -> Types { ocaml = "float"; ctypes = "float"}
  | GITypes.Double -> Types { ocaml = "float"; ctypes = "double"}
  | GITypes.GType as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.Utf8 -> Types { ocaml = "string"; ctypes = "string"}
  | GITypes.Filename -> Types { ocaml = "string"; ctypes = "string"}
  | GITypes.Array -> Types { ocaml = "Array.t structure"; ctypes = "Array.t_typ"} (* TODO : this is not GArray, this should find out which Array it is*)
  | GITypes.Interface as tag -> Not_implemented (GITypes.string_of_tag tag)
  | GITypes.GList -> Types { ocaml = "List.t structure"; ctypes = "List.t_typ"}
  | GITypes.GSList -> Types { ocaml = "SList.t structure"; ctypes = "SList.t_typ"}
  | GITypes.GHash -> Types { ocaml = "HashTable.t structure"; ctypes = "HashTable.t_typ"}
  | GITypes.Error -> Types { ocaml = "Error.t structure"; ctypes = "Error.t_typ"}
  | GITypes.Unichar as tag -> Not_implemented (GITypes.string_of_tag tag)


(* let type_info_to_bindings_types type_info =
  let tag = GITypeInfo.get_tag type_info in
  match type_tag_to_ocaml_type_string tag with
   | None -> None
   | Some ocaml_type -> match type_tag_to_ctypes_typ_string tag with
   | None -> None
   | Some ctypes_typ -> check_is_pointer type_info (ocaml_type, ctypes_typ) |>
   check_is_optional type_info
   *)
let write_open_module descr name =
  Printf.fprintf descr "open %s\n" name

let add_open_ctypes descr =
  write_open_module descr "Ctypes"

let add_open_foreign descr =
  write_open_module descr "Foreign"

let add_empty_line descr =
  Printf.fprintf descr "%s" "\n"

let escape_OCaml_keywords variable_name =
  match variable_name with
  | "and"
  | "as"
  | "asr"
  | "assert"
  | "begin"
  | "class"
  | "constraint"
  | "do"
  | "done"
  | "downto"
  | "else"
  | "end"
  | "exception"
  | "external"
  | "false"
  | "for"
  | "fun"
  | "function"
  | "functor"
  | "if"
  | "in"
  | "include"
  | "inherit"
  | "inherit!"
  | "initializer"
  | "land"
  | "lazy"
  | "let"
  | "lor"
  | "lsl"
  | "lsr"
  | "lxor"
  | "match"
  | "method"
  | "method!"
  | "mod"
  | "module"
  | "mutable"
  | "new"
  | "nonrec"
  | "object"
  | "of"
  | "open"
  | "open!"
  | "or"
  | "private"
  | "rec"
  | "sig"
  | "struct"
  | "then"
  | "to"
  | "true"
  | "try"
  | "type"
  | "val"
  | "val!"
  | "virtual"
  | "when"
  | "while"
  | "with" -> "_" ^ variable_name
  | _ -> variable_name

let has_number_at_beginning variable_name =
  let pattern = Str.regexp "[0-9].*" in
  Str.string_match pattern variable_name 0

let escape_number_at_beginning variable_name =
  if has_number_at_beginning variable_name then "_" ^ variable_name
  else variable_name

let ensure_valid_variable_name name =
  let n = escape_OCaml_keywords name in
  escape_number_at_beginning n
