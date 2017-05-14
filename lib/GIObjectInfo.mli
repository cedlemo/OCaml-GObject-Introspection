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

(** GIObjectInfo — Struct representing a GObject *)

open Ctypes

(** GIObjectInfo represents a GObject. This doesn't represent a specific
    instance of a GObject, instead this represent the object type (eg class).
    A GObject has methods, fields, properties, signals, interfaces, constants
    and virtual functions.*)
type t
val objectinfo : t structure typ

(** Obtain if the object type is an abstract type, eg if it cannot be
    instantiated *)
val get_abstract:
  t structure ptr -> bool

(** Obtain if the object type is of a fundamental type which is not
    G_TYPE_OBJECT. This is mostly for supporting GstMiniObject. *)
val get_fundamental:
  t structure ptr -> bool

(** Obtain the parent of the object type.*)
val get_parent:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Obtain the name of the objects class/type. *)
val get_type_name:
  t structure ptr -> string

(** Obtain the function which when called will return the GType function for
    which this object type is registered. *)
val get_type_init:
  t structure ptr -> string

(** Obtain the number of constants that this object type has. *)
val get_n_constants:
  t structure ptr -> int

(** Obtain an object type constant at index n . *)
val get_constant:
  t structure ptr -> int -> GIConstantInfo.t structure ptr

(** Obtain the number of fields that this object type has. *)
val get_n_fields:
  t structure ptr -> int

(** Obtain an object type field at index n . *)
val get_field:
  t structure ptr -> int -> GIFieldInfo.t structure ptr

(** Obtain the number of interfaces that this object type has. *)
val get_n_interfaces:
  t structure ptr -> int

(** Obtain an object type interface at index n . *)
val get_interface:
  t structure ptr -> int -> GIInterfaceInfo.t structure ptr

(** Obtain the number of methods that this object type has. *)
val get_n_methods:
  t structure ptr -> int

(** Obtain an object type method at index n . *)
val get_method:
  t structure ptr -> int -> GIFunctionInfo.t structure ptr

(** Obtain a method of the object type given a name . None will be returned if
    there's no method available with that name. *)
val find_method:
  t structure ptr -> string -> GIFunctionInfo.t structure ptr option

(** Obtain the number of properties that this object type has. *)
val get_n_properties:
  t structure ptr -> int

(** Obtain an object type property at index n .*)
val get_property:
  t structure ptr -> int -> GIPropertyInfo.t structure ptr

(** Obtain the number of signals that this object type has. *)
val get_n_signals:
  t structure ptr -> int

(** Obtain an object type signal at index n .*)
val get_signal:
  t structure ptr -> int -> GISignalInfo.t structure ptr

(** Find a signal with a name. *)
val find_signal:
  t structure ptr -> string -> GISignalInfo.t structure ptr option

(** Obtain the number of virtual functions that this object type has. *)
val get_n_vfuncs:
  t structure ptr -> int

(** Every GObject has two structures; an instance structure and a class
    structure. This function returns the metadata for the class structure.
    It returns a GIStructInfo.t or None. *)
val get_class_struct:
  t structure ptr -> GIStructInfo.t structure ptr option

(** Obtain a method of the object given a name , searching both the object info
    and any interfaces it implements. None will be returned if there's no
    method available with that name.
    Note that this function does *not* search parent classes; you will have to
    chain up if that's desired. *)
val find_method_using_interfaces:
  t structure ptr -> string -> (GIFunctionInfo.t structure ptr option *
                                t structure ptr option)

(** Obtain the symbol name of the function that should be called to ref this
    object type. It's mainly used fundamental types. The type signature for the
    symbol is GIObjectInfoRefFunction, to fetch the function pointer
    see GIObjectInfo.get_ref_function. *)
val get_ref_function:
  t structure ptr -> string option

(** Obtain the symbol name of the function that should be called to unref this
    object type. It's mainly used fundamental types. The type signature for the
    symbol is GIObjectInfoUnrefFunction, to fetch the function pointer see
    GIObjectInfo.get_unref_function. *)
val get_unref_function:
  t structure ptr -> string option

(** Obtain the symbol name of the function that should be called to convert set
    a GValue giving an object instance pointer of this object type. I's mainly
    used fundamental types. The type signature for the symbol is
    GIObjectInfoSetValueFunction, to fetch the function pointer see
    GIObjectInfo.get_set_value_function. *)
val get_set_value_function:
  t structure ptr -> string option

(** Obtain the symbol name of the function that should be called to convert an
    object instance pointer of this object type to a GValue. I's mainly used
    fundamental types. The type signature for the symbol is
    GIObjectInfoGetValueFunction, to fetch the function pointer see
    GIObjectInfo.get_get_value_function. *)
val get_get_value_function:
  t structure ptr -> string option

(*
  TODO : GIVFuncInfo *	g_object_info_get_vfunc ()
  TODO : GIVFuncInfo *	g_object_info_find_vfunc ()
  TODO : GIVFuncInfo *	g_object_info_find_vfunc_using_interfaces ()
  TODO : GIObjectInfoRefFunction	g_object_info_get_ref_function_pointer ()
  TODO : GIObjectInfoUnrefFunction	g_object_info_get_unref_function_pointer ()
  TODO : GIObjectInfoSetValueFunction	g_object_info_get_set_value_function_pointer ()
  TODO : GIObjectInfoGetValueFunction	g_object_info_get_get_value_function_pointer ()
*)
(** Just cast OCaml Ctypes base info to object info. *)
val cast_from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes object info to base info *)
val cast_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Return a GIObjectInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t from a GIObjectInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr
