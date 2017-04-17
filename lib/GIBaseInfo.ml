
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
open GIUnionInfo

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
  | Union of unioninfo (** union, see GIUnionInfo *)
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
  | Union _ -> "union"
  | Value -> "enum"
  | Signal -> "signal"
  | Vfunc -> "virtual"
  | Property -> "GObject"
  | Field -> "struct"
  | Arg -> "argument"
  | Type -> "type"
  | Unresolved -> "unresolved"

(** Obtain the name of the info . What the name represents depends on the
    GIInfoType of the info . For instance for GIFunctionInfo it is the name of
    the function. *)
external get_name:
  baseinfo -> string = "caml_g_ibaseinfo_get_name_c"

(** Obtain the info type of the GIBaseInfo *)
external get_type:
  baseinfo -> baseinfo_type = "caml_g_ibaseinfo_get_type_c"

(** Compare two GIBaseInfo.  Using pointer comparison is not practical since
    many functions return different instances of GIBaseInfo that refers to the
    same part of the TypeLib; use this function instead to do GIBaseInfo
    comparisons. *)
external equal:
  baseinfo -> baseinfo -> bool = "caml_g_ibaseinfo_equal_c"

(** Obtain the namespace of info .*)
external get_namespace:
  baseinfo -> string = "caml_g_ibaseinfo_get_namespace_c"

(** Iterate over all attributes associated with this node. *)
external iterate_over_attributes:
  baseinfo -> (string -> string -> bool) -> unit = "caml_g_ibaseinfo_iterate_over_attributes_c"

(** Obtain the container of the info . The container is the parent GIBaseInfo.
    For instance, the parent of a GIFunctionInfo is an GIObjectInfo or
    GIInterfaceInfo. *)
external get_container:
  baseinfo -> baseinfo = "caml_g_ibaseinfo_get_container_c"

(** Obtain whether the info is represents a metadata which is deprecated or not. *)
external is_deprecated:
  baseinfo -> bool = "caml_g_ibaseinfo_is_deprecated_c"

(*
 * TODO: GITypelib *	g_base_info_get_typelib ()
 * TODO: const gchar *	g_base_info_get_attribute ()
 *)
