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

(*
  TODO : gboolean	g_object_info_get_abstract ()
  TODO : gboolean	g_object_info_get_fundamental ()
  TODO : GIObjectInfo *	g_object_info_get_parent ()
  TODO : const gchar *	g_object_info_get_type_name ()
  TODO : const gchar *	g_object_info_get_type_init ()
  TODO : gint	g_object_info_get_n_constants ()
  TODO : GIConstantInfo *	g_object_info_get_constant ()
  TODO : gint	g_object_info_get_n_fields ()
  TODO : GIFieldInfo *	g_object_info_get_field ()
  TODO : gint	g_object_info_get_n_interfaces ()
  TODO : GIInterfaceInfo *	g_object_info_get_interface ()
  TODO : gint	g_object_info_get_n_methods ()
  TODO : GIFunctionInfo *	g_object_info_get_method ()
  TODO : GIFunctionInfo *	g_object_info_find_method ()
  TODO : GIFunctionInfo *	g_object_info_find_method_using_interfaces ()
  TODO : gint	g_object_info_get_n_properties ()
  TODO : GIPropertyInfo *	g_object_info_get_property ()
  TODO : gint	g_object_info_get_n_signals ()
  TODO : GISignalInfo *	g_object_info_get_signal ()
  TODO : GISignalInfo *	g_object_info_find_signal ()
  TODO : gint	g_object_info_get_n_vfuncs ()
  TODO : GIVFuncInfo *	g_object_info_get_vfunc ()
  TODO : GIVFuncInfo *	g_object_info_find_vfunc ()
  TODO : GIVFuncInfo *	g_object_info_find_vfunc_using_interfaces ()
  TODO : GIStructInfo *	g_object_info_get_class_struct ()
  TODO : const char *	g_object_info_get_ref_function ()
  TODO : GIObjectInfoRefFunction	g_object_info_get_ref_function_pointer ()
  TODO : const char *	g_object_info_get_unref_function ()
  TODO : GIObjectInfoUnrefFunction	g_object_info_get_unref_function_pointer ()
  TODO : const char *	g_object_info_get_set_value_function ()
  TODO : GIObjectInfoSetValueFunction	g_object_info_get_set_value_function_pointer ()
  TODO : const char *	g_object_info_get_get_value_function ()
  TODO : GIObjectInfoGetValueFunction	g_object_info_get_get_value_function_pointer ()
*)
(** Just cast OCaml Ctypes base info to object info. *)
val cast_baseinfo_to_objectinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes object info to base info *)
val cast_objectinfo_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Return a GIObjectInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val objectinfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t from a GIObjectInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_objectinfo:
  t structure ptr -> GIBaseInfo.t structure ptr
