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
type t
val baseinfo : t structure typ

(** Increases the reference count of underlying GIBaseInfo *info. *)
val base_info_ref:
  t structure ptr -> t structure ptr

(** Decreases the reference count of underlying GIBaseInfo *info . When its
    reference count drops to 0, the info is freed. *)
val base_info_unref:
  t structure ptr -> unit

(** Obtain the name of the info . What the name represents depends on the
    GIInfoType of the info . For instance for GIFunctionInfo it is the name of
    the function.*)
val get_name:
  t structure ptr -> string option

(** Compare two GIBaseInfo.
    Using pointer comparison is not practical since many functions return
    different instances of GIBaseInfo that refers to the same part of the
    TypeLib; use this function instead to do GIBaseInfo comparisons. *)
val equal:
  t structure ptr -> t structure ptr -> bool

(** Obtain the namespace of info *)
val get_namespace:
  t structure ptr -> string

(** Obtain whether the info is represents a metadata which is deprecated or not. *)
val is_deprecated:
  t structure ptr -> bool

type baseinfo_type =
  | Invalid (** invalid type *)
  | Function (** function, see GIFunctionInfo *)
  | Callback (** callback, see GIFunctionInfo *)
  | Struct (** struct, see GIStructInfo *)
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

(** Transform an integer value to a baseinfo_type. *)
val baseinfo_type_of_int:
  int -> baseinfo_type

(** Get the name of a baseinfo_type. *)
val string_of_baseinfo_type:
  baseinfo_type -> string

(** Obtain the info type of the GIBaseInfo. *)
val get_type:
  t structure ptr -> baseinfo_type
(*
  GIBaseInfo *	g_info_new ()
  TODO : GITypelib *	g_base_info_get_typelib ()
  TODO : const gchar *	g_base_info_get_attribute ()
  TODO : gboolean	g_base_info_iterate_attributes ()
  TODO : GIBaseInfo *	g_base_info_get_container ()
*)

val add_unref_finaliser_to_base_info:
  t structure ptr -> t structure ptr
