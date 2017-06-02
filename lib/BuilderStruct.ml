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

exception Not_Implemented of string

let raise_not_implemented message =
  raise (Not_Implemented message)

let raise_tag_not_implemented loc tag =
  let m = String.concat ":" [loc; GITypes.string_of_tag tag] in
  raise_not_implemented m

let append_ctypes_struct_declaration name sources_files =
  let (mli, ml) = sources_files in
  Printf.fprintf mli "open Ctypes\n";
  Printf.fprintf mli "type t\n";
  Printf.fprintf mli "val %s : t structure typ\n" (String.lowercase_ascii name);
  Printf.fprintf ml "open Ctypes\n";
  Printf.fprintf ml "open Foreign\n";
  Printf.fprintf ml "type t\n";
  Printf.fprintf ml "let %s : t structure typ = structure \"%s\"\n" (String.lowercase_ascii name) name

let append_ctypes_struct_fields_declarations struct_name info sources_files =
  let (mli, ml) = sources_files in
  let append_ctypes_struct_field_declarations field_info =
    let base_info = GIFieldInfo.to_baseinfo field_info in
    match GIBaseInfo.get_name base_info with
    | None -> ()
    | Some name ->
      let type_info = GIFieldInfo.get_type field_info in
      let is_pointer = GITypeInfo.is_pointer type_info in
      let (mli_type, ml_type) = match GITypeInfo.get_tag type_info with
      | GITypes.Void -> ("unit", "void")
      | GITypes.Boolean -> ("bool", "bool")
      | GITypes.Int8 -> ("int", "int8_t")
      | GITypes.Uint8 -> ("Unsigned.uint8", "uint8_t")
      | GITypes.Int16 -> ("int", "int16_t")
      | GITypes.Uint16 -> ("Unsigned.uint16", "uint16_t")
      | GITypes.Int32 -> ("Int32", "int32_t")
      | GITypes.Uint32 -> ("Unsigned.uint32", "uint32_t")
      | GITypes.Int64 -> ("Int64", "int64_t")
      | GITypes.Uint64 -> ("Unsigned.uint64", "uint64_t")
      | GITypes.Float -> ("float", "float")
      | GITypes.Double -> ("float", "double")
      | GITypes.GType as tag -> raise_tag_not_implemented __LOC__ tag
      | GITypes.Utf8 -> ("string", "string")
      | GITypes.Filename -> ("string", "string")
      | GITypes.Array -> ("Array.t structure", "Array.array")
      | GITypes.Interface as tag -> raise_tag_not_implemented __LOC__ tag
      | GITypes.GList -> ("List.t structure", "List.list")
      | GITypes.GSList -> ("SList.t structure", "SList.slist")
      | GITypes.GHash -> ("Hash.t structure", "Hash.ghash")
      | GITypes.Error -> ("Error.t structure", "Error.error")
      | GITypes.Unichar as tag -> raise_tag_not_implemented __LOC__ tag
      in
      let (mli_type', ml_type') = if is_pointer then (mli_type ^ " ptr", "ptr_opt " ^ ml_type)
        else (mli_type, ml_type) in
      Printf.fprintf mli "val %s: (%s, t structure) field\n" name mli_type';
      Printf.fprintf ml "let %s = field %s \"%s\" (%s)\n" name struct_name name ml_type'
  in
  let n = GIStructInfo.get_n_fields info in
  for i = 0 to n - 1 do
    let field_info = GIStructInfo.get_field info i in
    append_ctypes_struct_field_declarations field_info
  done
