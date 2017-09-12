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
  Printf.fprintf descr "(* %s. *)\n" information

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

let get_binding_name info =
  match Base_info.get_name info with
  | None -> None
  | Some name ->
    let bindings_name = Lexer.snake_case name in
    Some bindings_name

let string_pattern_remove str pattern =
  let reg = Str.regexp_string pattern in
  String.concat "" (Str.split reg str)

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
        match get_binding_name interface with
        | None -> Not_implemented (Base_info.string_of_baseinfo_type t)
        | Some name ->
        Types (check_if_pointer (Printf.sprintf "(* interface *) %s.t structure" name, Printf.sprintf "(* interface *) %s.t_typ" name))
      )
      | Boxed as t -> Not_implemented (Base_info.string_of_baseinfo_type t)
      | Enum as t -> (
        match get_binding_name interface with
        | None -> Not_implemented (Base_info.string_of_baseinfo_type t)
        | Some name ->
        Types {ocaml = Printf.sprintf "(* interface *) %s.t" name; ctypes = Printf.sprintf "(* interface *) %s.t_view" name}
      )
      | Flags as t -> (
        match get_binding_name interface with
        | None -> Not_implemented (Base_info.string_of_baseinfo_type t)
        | Some name ->
        Types {ocaml = Printf.sprintf "(* interface *) %s.t_list" name; ctypes = Printf.sprintf "(* interface *) %s.t_list_view" name}
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

type file = {
  name: string;
  descr : Pervasives.out_channel;
}

type files = {
  ml : file;
  mli : file;
}

let file_in_create_append_mode name =
  Pervasives.open_out_gen [Open_trunc; Open_append; Open_creat] 0o666 name

let generate_sources base_name =
  let name = base_name ^ ".ml" in
  let descr = file_in_create_append_mode name in
  let ml = {name; descr} in
  let name = base_name ^ ".mli" in
  let descr = file_in_create_append_mode name in
  let mli = {name; descr} in
  {ml; mli}

let close_sources source_files =
  let close_file f =
    if Sys.file_exists f.name then (Pervasives.close_out f.descr)
  in
  close_file source_files.ml;
  close_file source_files.mli

let append_open_ctypes_modules (mli_descr, ml_descr) =
  add_open_ctypes mli_descr;
  add_open_ctypes ml_descr;
  add_open_foreign ml_descr;
  add_empty_line mli_descr;
  add_empty_line ml_descr

let generate_ctypes_sources base_name =
  let sources = generate_sources base_name in
  let _ = append_open_ctypes_modules (sources.mli.descr, sources.ml.descr) in
  sources

let parse_struct_info info source_files =
  match get_binding_name info with
  | None -> ()
  | Some name -> let f_descrs = (source_files.mli.descr,
                                 source_files.ml.descr) in
    let info' = Struct_info.from_baseinfo info in
    Bind_struct.append_ctypes_struct_declaration name f_descrs;
    Bind_struct.append_ctypes_struct_fields_declarations name info' f_descrs;
    Bind_struct.append_ctypes_struct_methods_bindings name info' f_descrs;
    add_empty_line source_files.mli.descr;
    add_empty_line source_files.ml.descr

let parse_enum_info info source_files =
  match get_binding_name info with
  | None -> ()
  | Some name -> let f_descrs = (source_files.mli.descr,
                                 source_files.ml.descr) in
    let info' = Enum_info.from_baseinfo info in
    Bind_enum.append_ctypes_enum_bindings name info' f_descrs;
    add_empty_line source_files.mli.descr;
    add_empty_line source_files.ml.descr

let parse_flags_info info source_files =
  match get_binding_name info with
  | None -> ()
  | Some name -> let f_descrs = (source_files.mli.descr,
                                 source_files.ml.descr) in
    let info' = Enum_info.from_baseinfo info in
    Bind_enum.append_ctypes_flags_bindings name info' f_descrs;
    add_empty_line source_files.mli.descr;
    add_empty_line source_files.ml.descr

let parse_constant_info info source_files =
  match Base_info.get_name info with
  | None -> ()
  | Some name -> let info' = Constant_info.from_baseinfo info in
    let type_info = Constant_info.get_type info' in
    let not_implemented_todo_comments tag (mli, ml) =
      let tag_name = Types.string_of_tag tag in
      Printf.fprintf mli "(* TODO : constant %s type not implemented for %s *)" name tag_name;
      Printf.fprintf mli "(* TODO : constant %s type not implemented for %s *)" name tag_name
    in
    let f_descrs = (source_files.mli.descr,
                    source_files.ml.descr) in
    let _ = match Type_info.get_tag type_info with
    | Types.Void as tag -> not_implemented_todo_comments tag f_descrs
    | Types.Boolean ->
      Bind_constant.append_boolean_constant name info' f_descrs
    | Types.Int8 ->
      Bind_constant.append_int8_constant name info' f_descrs
    | Types.Uint8 ->
      Bind_constant.append_uint8_constant name info' f_descrs
    | Types.Int16 ->
      Bind_constant.append_int16_constant name info' f_descrs
    | Types.Uint16 ->
      Bind_constant.append_uint16_constant name info' f_descrs
    | Types.Int32 ->
      Bind_constant.append_int32_constant name info' f_descrs
    | Types.Uint32 ->
      Bind_constant.append_uint32_constant name info' f_descrs
    | Types.Int64 ->
      Bind_constant.append_int64_constant name info' f_descrs
    | Types.Uint64 ->
      Bind_constant.append_uint64_constant name info' f_descrs
    | Types.Float ->
      Bind_constant.append_float_constant name info' f_descrs
    | Types.Double ->
      Bind_constant.append_double_constant name info' f_descrs
    | Types.GType as tag -> not_implemented_todo_comments tag f_descrs
    | Types.Utf8 ->
      Bind_constant.append_string_constant name info' f_descrs
    | Types.Filename as tag -> not_implemented_todo_comments tag f_descrs
    | Types.Array as tag -> not_implemented_todo_comments tag f_descrs
    | Types.Interface as tag -> not_implemented_todo_comments tag f_descrs
    | Types.GList as tag -> not_implemented_todo_comments tag f_descrs
    | Types.GSList as tag -> not_implemented_todo_comments tag f_descrs
    | Types.GHash as tag -> not_implemented_todo_comments tag f_descrs
    | Types.Error as tag -> not_implemented_todo_comments tag f_descrs
    | Types.Unichar as tag -> not_implemented_todo_comments tag f_descrs
    in
    add_empty_line source_files.mli.descr;
    add_empty_line source_files.ml.descr

let parse_union_info info source_files =
  match get_binding_name info with
  | None -> ()
  | Some name -> let f_descrs = (source_files.mli.descr,
                                 source_files.ml.descr) in
    let info' = Union_info.from_baseinfo info in
    Bind_union.append_ctypes_union_declaration name f_descrs;
    Bind_union.append_ctypes_union_fields_declarations name info' f_descrs;
    add_empty_line source_files.mli.descr;
    add_empty_line source_files.ml.descr
