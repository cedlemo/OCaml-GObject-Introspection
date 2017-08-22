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

(** Base_info — Base struct for all GITypelib structs *)
open Ctypes

(** Base_info is the common base struct of all other *Info structs accessible
    through the Repository API. All other structs can be casted to a
    Base_info *)
type t
val baseinfo : t structure typ

(** Increases the reference count of underlying Base_info *info. *)
val base_info_ref:
  t structure ptr -> t structure ptr

(** Decreases the reference count of underlying Base_info *info . When its
    reference count drops to 0, the info is freed. *)
val base_info_unref:
  t structure ptr -> unit

(** Obtain the name of the info . What the name represents depends on the
    GIInfoType of the info . For instance for Function_info it is the name of
    the function.*)
val get_name:
  t structure ptr -> string option

(** Compare two Base_info.
    Using pointer comparison is not practical since many functions return
    different instances of Base_info that refers to the same part of the
    TypeLib; use this function instead to do Base_info comparisons. *)
val equal:
  t structure ptr -> t structure ptr -> bool

(** Obtain the namespace of info *)
val get_namespace:
  t structure ptr -> string

(** Obtain whether the info is represents a metadata which is deprecated or not. *)
val is_deprecated:
  t structure ptr -> bool

(** Obtain the container of the info . The container is the parent Base_info.
    For instance, the parent of a Function_info is an Object_info or
    Interface_info. *)
val get_container:
  t structure ptr -> t structure ptr option

type baseinfo_type =
  | Invalid (** invalid type *)
  | Function (** function, see Function_info *)
  | Callback (** callback, see Function_info *)
  | Struct (** struct, see Struct_info *)
  | Boxed (** boxed, see Struct_info or Union_info *)
  | Enum (** enum, see Enum_info *)
  | Flags (** flags, see Enum_info *)
  | Object (** object, see Object_info *)
  | Interface (** interface, see Interface_info *)
  | Constant (** contant, see Constant_info *)
  | Invalid_0 (** deleted, used to be GI_INFO_TYPE_ERROR_DOMAIN. *)
  | Union (** union, see Union_info *)
  | Value (** enum value, see Value_info *)
  | Signal (** signal, see Signal_info *)
  | Vfunc (** virtual function, see GIVFuncInfo *)
  | Property (** GObject property, see Property_info *)
  | Field (** struct or union field, see Field_info *)
  | Arg (** argument of a function or callback, see Arg_info *)
  | Type (** type information, see Type_info *)
  | Unresolved (** unresolved type, a type which is not present in the typelib, or any of its dependencies. *)

(** Transform an integer value to a baseinfo_type. *)
val baseinfo_type_of_int:
  int -> baseinfo_type

(** Get the name of a baseinfo_type. *)
val string_of_baseinfo_type:
  baseinfo_type -> string

(** Obtain the info type of the Base_info. *)
val get_type:
  t structure ptr -> baseinfo_type
(*
  Base_info *	g_info_new ()
  TODO : GITypelib *	g_base_info_get_typelib ()
  TODO : const gchar *	g_base_info_get_attribute ()
  TODO : gboolean	g_base_info_iterate_attributes ()
*)

val add_unref_finaliser:
  t structure ptr -> t structure ptr
