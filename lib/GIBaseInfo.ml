
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

(** GIBaseInfo — Base struct for all GITypelib structs *)
open GIFunctionInfo
open GIStructInfo

(** GIBaseInfo is the common base struct of all other *Info structs accessible
 through the GIRepository API *)
type baseinfo

type baseinfo_type =
  | Invalid (** invalid type *)
  | Function of functioninfo (** function, see GIFunctionInfo *)
  | Callback of functioninfo (** callback, see GIFunctionInfo *)
  | Struct of structinfo (** struct, see GIStructInfo *)
  | Boxed (** boxed, see GIStructInfo or GIUnionInfo *)
  | Enum (** enum, see GIEnumInfo *)
  | Flags (** flags, see GIEnumInfo *)
  | Object (** object, see GIObjectInfo *)
  | Interface (** interface, see GIInterfaceInfo *)
  | Constant (** contant, see GIConstantInfo *)
  | Invalid_0 (** deleted, used to be GI_INFO_TYPE_ERROR_DOMAIN. *)
  | Union (** union, see GIUnionInfo *)
  | Value (** enum value, see GIValueInfo *)
  | Signal (** signal, see GISignalInfo *)
  | Vfunc (** virtual function, see GIVFuncInfo *)
  | Property (** GObject property, see GIPropertyInfo *)
  | Field (** struct or union field, see GIFieldInfo *)
  | Arg (** argument of a function or callback, see GIArgInfo *)
  | Type (** type information, see GITypeInfo *)
  | Unresolved (** unresolved type, a type which is not present in the typelib, or any of its dependencies. *)

let baseinfo_type_get_name baseinfo_t =
  match baseinfo_t with
  | Invalid -> "invalid"
  | Function _ -> "function"
  | Callback _ -> "callback"
  | Struct _ -> "struct"
  | Boxed -> "boxed"
  | Enum -> "enum"
  | Flags -> "flags"
  | Object -> "object"
  | Interface -> "interface"
  | Constant -> "contant"
  | Invalid_0 -> "deleted"
  | Union -> "union"
  | Value -> "enum"
  | Signal -> "signal"
  | Vfunc -> "virtual"
  | Property -> "GObject"
  | Field -> "struct"
  | Arg -> "argument"
  | Type -> "type"
  | Unresolved -> "unresolved"

external get_name:
  baseinfo -> string = "caml_g_ibaseinfo_get_name_c"

external get_type:
  baseinfo -> baseinfo_type = "caml_g_ibaseinfo_get_type_c"

external equal:
  baseinfo -> baseinfo -> bool = "caml_g_ibaseinfo_equal_c"

external get_namespace:
  baseinfo -> string = "caml_g_ibaseinfo_get_namespace_c"

external iterate_over_attributes:
  baseinfo -> (string -> string -> bool) -> unit = "caml_g_ibaseinfo_iterate_over_attributes_c"

external get_container:
  baseinfo -> baseinfo = "caml_g_ibaseinfo_get_container_c"

external is_deprecated:
  baseinfo -> bool = "caml_g_ibaseinfo_is_deprecated_c"
