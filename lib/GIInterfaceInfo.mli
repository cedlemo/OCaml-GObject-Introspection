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

(** Obtain an interface type prerequisites index n . *)
val get_prerequisite:
  t structure ptr -> int -> GIBaseInfo.t structure ptr

(** Obtain the number of properties that this interface type has.*)
val get_n_properties:
  t structure ptr -> int

(** Obtain an interface type property at index n . *)
val get_property:
  t structure ptr -> int -> GIPropertyInfo.t structure ptr

(** Obtain the number of methods that this interface type has. *)
val get_n_methods:
  t structure ptr -> int

(** Obtain an interface type method at index n . *)
val get_method:
  t structure ptr -> int -> GIFunctionInfo.t structure ptr

(** Obtain a method of the interface type given a name . NULL will be returned
    if there's no method available with that name. *)
val find_method:
  t structure ptr -> string -> GIFunctionInfo.t structure ptr option

(** Obtain the number of signals that this interface type has. *)
val get_n_signals:
  t structure ptr -> int

(** Obtain an interface type signal at index n . *)
val get_signal:
  t structure ptr -> int -> GISignalInfo.t structure ptr

(** Find a signal of the interface *)
val find_signal:
  t structure ptr -> string -> GISignalInfo.t structure ptr option

(** Obtain the number of constants that this interface type has. *)
val get_n_constants:
  t structure ptr -> int

(** Obtain an interface type constant at index n . *)
val get_constant:
  t structure ptr -> int -> GIConstantInfo.t structure ptr

(** Returns the layout C structure associated with this GInterface. *)
val get_iface_struct:
  t structure ptr -> GIStructInfo.t structure ptr option

(*
  TODO : gint	g_interface_info_get_n_vfuncs ()
  TODO : GIVFuncInfo *	g_interface_info_get_vfunc ()
  TODO : GIVFuncInfo *	g_interface_info_find_vfunc ()
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
