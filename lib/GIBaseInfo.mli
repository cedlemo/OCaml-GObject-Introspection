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
open Ctypes

(** GIBaseInfo is the common base struct of all other *Info structs accessible
    through the GIRepository API. All other structs can be casted to a
    GIBaseInfo *)
type baseinfo
val baseinfo : baseinfo structure typ

(** Increases the reference count of underlying GIBaseInfo *info. *)
val base_info_ref:
  baseinfo structure ptr -> baseinfo structure ptr

(** Decreases the reference count of underlying GIBaseInfo *info . When its
    reference count drops to 0, the info is freed. *)
val base_info_unref:
  baseinfo structure ptr -> unit

(** Obtain the name of the info . What the name represents depends on the
    GIInfoType of the info . For instance for GIFunctionInfo it is the name of
    the function.*)
val get_name:
  baseinfo structure ptr -> string option

(** Compare two GIBaseInfo.
    Using pointer comparison is not practical since many functions return
    different instances of GIBaseInfo that refers to the same part of the
    TypeLib; use this function instead to do GIBaseInfo comparisons. *)
val equal:
  baseinfo structure ptr -> baseinfo structure ptr -> bool

(** Obtain the namespace of info *)
val get_namespace:
  baseinfo structure ptr -> string

(** Obtain whether the info is represents a metadata which is deprecated or not. *)
val is_deprecated:
  baseinfo structure ptr -> bool

type baseinfo_type =
  | Invalid (** invalid type *)
  | Function of (GIFunctionInfo.functioninfo structure ptr) (** function, see GIFunctionInfo *)
  | Callback of (GIFunctionInfo.functioninfo structure ptr) (** callback, see GIFunctionInfo *)
  | Struct of (GIStructInfo.structinfo structure ptr) (** struct, see GIStructInfo *)
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

val get_type:
  baseinfo structure ptr -> baseinfo_type
(*
  GIBaseInfo *	g_info_new ()
  TODO : GITypelib *	g_base_info_get_typelib ()
  TODO : const gchar *	g_base_info_get_attribute ()
  TODO : gboolean	g_base_info_iterate_attributes ()
  TODO : GIBaseInfo *	g_base_info_get_container ()
*)

val baseinfo_to_functioninfo:
  baseinfo structure ptr -> GIFunctionInfo.functioninfo structure ptr

val functioninfo_to_baseinfo:
  GIFunctionInfo.functioninfo structure ptr -> baseinfo structure ptr

val baseinfo_to_structinfo:
  baseinfo structure ptr -> GIStructInfo.structinfo structure ptr

val structinfo_to_baseinfo:
  GIStructInfo.structinfo structure ptr -> baseinfo structure ptr

val baseinfo_to_fieldinfo:
  baseinfo structure ptr -> GIFieldInfo.fieldinfo structure ptr

val fieldinfo_to_baseinfo:
  GIFieldInfo.fieldinfo structure ptr -> baseinfo structure ptr
