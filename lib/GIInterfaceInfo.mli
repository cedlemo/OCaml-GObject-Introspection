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

(** GIInterfaceInfo — Struct representing a GInterface *)

open Ctypes

(** GIInterfaceInfo represents a GInterface type.
    A GInterface has methods, fields, properties, signals, interfaces,
    constants, virtual functions and prerequisites.*)
type t
val interfaceinfo : t structure typ

(** Obtain the number of prerequisites for this interface type. A prerequisites
    is another interface that needs to be implemented for interface, similar to
    an base class for GObjects. *)
val get_n_prerequisites:
  t structure ptr -> int

(*
  TODO : GIBaseInfo *	g_interface_info_get_prerequisite ()
  TODO : gint	g_interface_info_get_n_properties ()
  TODO : GIPropertyInfo *	g_interface_info_get_property ()
  TODO : gint	g_interface_info_get_n_methods ()
  TODO : GIFunctionInfo *	g_interface_info_get_method ()
  TODO : GIFunctionInfo *	g_interface_info_find_method ()
  TODO : gint	g_interface_info_get_n_signals ()
  TODO : GISignalInfo *	g_interface_info_get_signal ()
  TODO : GISignalInfo *	g_interface_info_find_signal ()
  TODO : gint	g_interface_info_get_n_vfuncs ()
  TODO : GIVFuncInfo *	g_interface_info_get_vfunc ()
  TODO : GIVFuncInfo *	g_interface_info_find_vfunc ()
  TODO : gint	g_interface_info_get_n_constants ()
  TODO : GIConstantInfo *	g_interface_info_get_constant ()
  TODO : GIStructInfo *	g_interface_info_get_iface_struct ()
*)

(** Just cast OCaml Ctypes base info to interface info. *)
val cast_from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes interface info to base info *)
val cast_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Add unref of the C underlying structure whith Gc.finalise. *)
val add_unref_finaliser:
  t structure ptr -> t structure ptr

(** Return a GIInterfaceInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t from a GIInterfaceInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr
