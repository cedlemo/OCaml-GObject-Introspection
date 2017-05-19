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

(** GIVFuncInfo — Struct representing a virtual function. *)

open Ctypes

(** GIVfuncInfo represents a virtual function. A property belongs to either a
    GIObjectInfo or a GIInterfaceInfo. *)
type t
val vfuncinfo : t structure typ

(** Obtain the offset of the function pointer in the class struct. The value
    0xFFFF indicates that the struct offset is unknown. *)
val get_offset:
  t structure ptr -> int

(** Obtain the signal for the virtual function if one is set. The signal comes
    from the object or interface to which this virtual function belongs.
    In order to avoid circular call graph between GIVFuncInfo and GISignalInfo,
    this function will return a GICallableInfo. It is upto the user to use
    GISignalInfo.from_callableinfo in order to have the GISignalInfo.*)
val get_signal:
  t structure ptr -> GICallableInfo.t structure ptr option

type flags =
  | Must_chain_up     (** chains up to the parent type *)
  | Must_override     (** overrides *)
  | Must_not_override (** does not override *)
  | Throws            (** Includes  a GError *)

val string_of_flags:
  flags -> string

(** Obtain the flags for this virtual function info. See GIVFuncInfoFlags for
    more information about possible flag values. *)
val get_flags:
  t structure ptr -> flags list

(*
  TODO : GIFunctionInfo *	g_vfunc_info_get_invoker ()
  TODO : gpointer	g_vfunc_info_get_address ()
  TODO : gboolean	g_vfunc_info_invoke ()
 *)

(** Just cast OCaml Ctypes base info to vfunc info. *)
val cast_from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes vfunc info to base info *)
val cast_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Add unref of the C underlying structure whith Gc.finalise. *)
val add_unref_finaliser:
  t structure ptr -> t structure ptr

(** Return a GIVFuncInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t from a GIVFuncInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Just cast OCaml Ctypes callable info to vfunc info. *)
val cast_from_callableinfo:
  GICallableInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes vfunc info to callable info *)
val cast_to_callableinfo:
  t structure ptr -> GICallableInfo.t structure ptr

(** Return a GIVFuncInfo.t from a GICallableInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val from_callableinfo:
  GICallableInfo.t structure ptr -> t structure ptr

(** Return a GICallableInfo.t from a GIVFuncInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val to_callableinfo:
  t structure ptr -> GICallableInfo.t structure ptr
