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

module Option = struct
  let value ~default value_or_none =
    match value_or_none with
      | None -> default
      | Some v -> v
end

let write_open_module descr name =
  Printf.fprintf descr "open %s\n" name

let add_open_ctypes descr =
  write_open_module descr "Ctypes"

let add_open_foreign descr =
  write_open_module descr "Foreign"

let add_empty_line descr =
  Printf.fprintf descr "%s" "\n"

let add_comments descr information =
  Printf.fprintf descr "(* %s . *)\n" information

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

let escape_OCaml_types name =
  match name with
  | "int"
  | "float"
  | "list"
  | "string"
  | "char"
  | "array" -> "_" ^ name
  | _ -> name

(* Taken from https://realworldocaml.org/v1/en/html/foreign-function-interface.html. *)
let escape_Ctypes_types name =
  match name with
  | "void"
  | "char"
  | "schar"
  | "short"
  | "int"
  | "long"
  | "llong"
  | "nativeint"
  | "int8_t"
  | "int16_t"
  | "int32_t"
  | "int64_t"
  | "uchar"
  | "uint8_t"
  | "uint16_t"
  | "uint32_t"
  | "uint64_t"
  | "size_t"
  | "ushort"
  | "uint"
  | "ulong"
  | "ullong"
  | "float"
  | "double"
  | "complex32"
  | "complex64" -> "_" ^ name
  | _ -> name

let ensure_valid_variable_name name =
  escape_OCaml_keywords name
  |> escape_OCaml_types
  |> escape_Ctypes_types
  |> escape_number_at_beginning

let get_enum_type_name enum_name =
  String.lowercase_ascii enum_name

let camel_case_to_capitalized_snake_case str =
  let extract str start stop =
    let len = (stop + 1) - start in
    let sub_string = String.sub str start len in
    if start == 0 then String.capitalize_ascii sub_string (* ensure that the first part is always capitalized *)
    else String.lowercase_ascii sub_string
  in
  let len = String.length str in
  if len <= 1 then String.capitalize_ascii str
  else (
    let rec _parse str start acc index =
      if index + 1 == len then let sub_string = extract str start index in
      let acc' = (sub_string :: acc) in String.concat "_" (List.rev acc')
      else (
        let c = str.[index] in
        let c_next = str.[index + 1] in
        if c == Char.lowercase_ascii c && c_next == Char.uppercase_ascii c_next then
          let sub_string = extract str start index in
          let acc' = (sub_string :: acc) in
          _parse str (index + 1) acc' (index + 1)
        else
          _parse str start acc (index + 1)
      )
    in _parse str 0 [] 0
  )

let get_bindings_name info =
  match Base_info.get_name info with
  | None -> None
  | Some name ->
    let bindings_name = Lexer.snake_case name in
    Some bindings_name

type type_strings = { ocaml : string;
                      ctypes : string }

type bindings_types = Not_implemented of string | Types of type_strings

let type_tag_to_bindings_types = function
  | Types.Void -> Types { ocaml = "unit"; ctypes = "void" }
  | Types.Boolean -> Types { ocaml = "bool"; ctypes = "bool"}
  | Types.Int8 -> Types { ocaml = "int"; ctypes = "int8_t"}
  | Types.Uint8 -> Types { ocaml = "Unsigned.uint8"; ctypes = "uint8_t"}
  | Types.Int16 -> Types { ocaml = "int"; ctypes = "int16_t"}
  | Types.Uint16 -> Types { ocaml = "Unsigned.uint16"; ctypes = "uint16_t"}
  | Types.Int32 -> Types { ocaml = "int32"; ctypes = "int32_t"}
  | Types.Uint32 -> Types { ocaml = "Unsigned.uint32"; ctypes = "uint32_t"}
  | Types.Int64 -> Types { ocaml = "int64"; ctypes = "int64_t"}
  | Types.Uint64 -> Types { ocaml = "Unsigned.uint64"; ctypes = "uint64_t"}
  | Types.Float -> Types { ocaml = "float"; ctypes = "float"}
  | Types.Double -> Types { ocaml = "float"; ctypes = "double"}
  | Types.GType as tag -> Not_implemented (Types.string_of_tag tag)
  | Types.Utf8 as tag-> Not_implemented (Types.string_of_tag tag)
  | Types.Filename as tag -> Not_implemented (Types.string_of_tag tag)
  | Types.Array as tag -> Not_implemented (Types.string_of_tag tag)
  | Types.Interface as tag -> Not_implemented (Types.string_of_tag tag)
  | Types.GList as tag -> Not_implemented (Types.string_of_tag tag)
  | Types.GSList as tag -> Not_implemented (Types.string_of_tag tag)
  | Types.GHash as tag -> Not_implemented (Types.string_of_tag tag)
  | Types.Error as tag -> Not_implemented (Types.string_of_tag tag)
  | Types.Unichar as tag -> Not_implemented (Types.string_of_tag tag)

let type_info_to_bindings_types type_info maybe_null =
  let check_if_pointer (ocaml_t, ctypes_t) =
    if Type_info.is_pointer type_info then
      if maybe_null then {ocaml = ocaml_t ^ " ptr option";
                          ctypes = "ptr_opt " ^ ctypes_t}
      else {ocaml = ocaml_t ^ " ptr";
            ctypes = "ptr " ^ ctypes_t}
    else {ocaml = ocaml_t; ctypes = ctypes_t}
  in
  match Type_info.get_interface type_info with
  | None -> (
    match Type_info.get_tag type_info with
    | Types.Void -> Types (check_if_pointer ("unit", "void"))
    | Types.Boolean -> Types (check_if_pointer ("bool", "bool"))
    | Types.Int8 -> Types (check_if_pointer ("int", "int8_t"))
    | Types.Uint8 -> Types (check_if_pointer ("Unsigned.uint8", "uint8_t"))
    | Types.Int16 -> Types (check_if_pointer ("int", "int16_t"))
    | Types.Uint16 -> Types (check_if_pointer ("Unsigned.uint16", "uint16_t"))
    | Types.Int32 -> Types (check_if_pointer ("int32", "int32_t"))
    | Types.Uint32 -> Types (check_if_pointer ("Unsigned.uint32", "uint32_t"))
    | Types.Int64 -> Types (check_if_pointer ("int64", "int64_t"))
    | Types.Uint64 -> Types (check_if_pointer ("Unsigned.uint64", "uint64_t"))
    | Types.Float -> Types (check_if_pointer ("float", "float"))
    | Types.Double -> Types (check_if_pointer ("float", "double"))
    | Types.GType as tag -> Not_implemented (Types.string_of_tag tag)
    | Types.Utf8 -> if maybe_null then Types {ocaml = "string option";
                                                ctypes = "string_opt"}
      else Types {ocaml = "string"; ctypes = "string"}
    | Types.Filename -> if maybe_null then Types {ocaml = "string option";
                                                    ctypes = "string_opt"}
      else Types {ocaml = "string"; ctypes = "string"}
    | Types.Array -> (
      match Type_info.get_array_type type_info with
      | None -> Not_implemented ("Bad Array type for Types.Array tag")
      | Some array_type ->
        match array_type with
        | Types.C -> Not_implemented ("C Array type for Types.Array tag")
        | Types.Array -> Types (check_if_pointer ("Array.t structure", "Array.t_typ"))
        | Types.Ptr_array -> Types (check_if_pointer ("Ptr_array.t structure", "Ptr_array.t_typ"))
        | Types.Byte_array -> Types (check_if_pointer ("Byte_array.t structure", "Byte_array.t_typ"))
      )
    | Types.Interface as tag -> Not_implemented (Types.string_of_tag tag)
    | Types.GList -> Types (check_if_pointer ("List.t structure", "List.t_typ"))
    | Types.GSList -> Types (check_if_pointer ("SList.t structure", "SList.t_typ"))
    | Types.GHash -> Types (check_if_pointer ("Hash_table.t structure", "Hash_table.t_typ"))
    | Types.Error -> Types (check_if_pointer ("Error.t structure", "Error.t_typ"))
    | Types.Unichar as tag -> Not_implemented (Types.string_of_tag tag)
    )
  | Some interface ->
      match Base_info.get_type interface with
      | Invalid as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Function as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Callback as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Struct as t -> (
        match get_bindings_name interface with
        | None -> Not_implemented (Base_info.string_of_baseinfo_type t)
        | Some name ->
        Types (check_if_pointer (Printf.sprintf "%s.t structure" name, Printf.sprintf "%s.t_typ" name))
      )
      | Boxed as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Enum as t -> (
        match get_bindings_name interface with
        | None -> Not_implemented (Base_info.string_of_baseinfo_type t)
        | Some name -> let view_name = String.lowercase_ascii name in
        Types {ocaml = Printf.sprintf "Core.%s" view_name; ctypes = Printf.sprintf "Core.%s" view_name}
      )
      | Flags as t -> (
        match get_bindings_name interface with
        | None -> Not_implemented (Base_info.string_of_baseinfo_type t)
        | Some name -> let view_name = (String.lowercase_ascii name) ^ "_list" in
        Types {ocaml = Printf.sprintf "Core.%s" view_name; ctypes = Printf.sprintf "Core.%s" view_name}
      )
      | Object as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Interface as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Constant as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Invalid_0 as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Union as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Value as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Signal as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Vfunc as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Property as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Field as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Arg as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Type as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Unresolved as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
