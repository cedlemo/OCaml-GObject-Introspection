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

let type_tag_to_ctypes_strings tag =
  match tag with
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
