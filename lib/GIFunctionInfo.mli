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

(** GIFunctionInfo — Struct representing a function. *)

open Ctypes

(** GIFunctionInfo represents a function, method or constructor. To find out
    what kind of entity a GIFunctionInfo represents, call
    GIFunctionInfo.get_flags.
    See also GICallableInfo for information on how to retreive arguments and
    other metadata. *)
type t
val functioninfo : t structure typ

(** Obtain the symbol of the function. The symbol is the name of the exported
    function, suitable to be used as an argument to g_module_symbol().*)
val get_symbol:
  t structure ptr -> string

(** Flags for a GIFunctionInfo struct. *)
type flags =
  | Is_method      (** is a method. *)
  | Is_constructor (** is a constructor. *)
  | Is_getter      (** is a getter of a GIPropertyInfo. *)
  | Is_setter      (** is a setter of a GIPropertyInfo. *)
  | Wraps_vfunc    (** represents a virtual function. *)
  | Throws         (** the function may throw an error. *)

(** Obtain the GIFunctionInfoFlags for the info . *)
val get_flags:
  t structure ptr -> flags list

(** Obtain the property associated with this GIFunctionInfo. Only
    GIFunctionInfo with the flag GIFunction.Is_getter or GIFunction.Is_setter
    have a property set. For other cases, NULL will be returned. *)
val get_property:
  t structure ptr -> GIPropertyInfo.t structure ptr option

(** Obtain the virtual function associated with this GIFunctionInfo. Only
    GIFunctionInfo with the flag Wraps_vfunc has a virtual function set. For
    other cases, None will be returned. *)
val get_vfunc:
  t structure ptr -> GIVFuncInfo.t structure ptr option

(*
  gboolean	g_function_info_invoke ()
  GQuark	g_invoke_error_quark ()
*)

(** Just cast OCaml Ctypes base info to function info. *)
val cast_from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes function info to base info *)
val cast_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Add unref of the C underlying structure whith Gc.finalise. *)
val add_unref_finaliser:
  t structure ptr -> t structure ptr

(** Return a GIFunctionInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t from a GIFunctionInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Just cast OCaml Ctypes callable info to function info. *)
val cast_from_callableinfo:
  GICallableInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes function info to callable info *)
val cast_to_callableinfo:
  t structure ptr -> GICallableInfo.t structure ptr

(** Return a GIFunctionInfo.t from a GICallableInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val from_callableinfo:
  GICallableInfo.t structure ptr -> t structure ptr

(** Return a GICallableInfo.t from a GIFunctionInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val to_callableinfo:
  t structure ptr -> GICallableInfo.t structure ptr
