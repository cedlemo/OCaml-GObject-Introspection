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

(** GICallableInfo — Struct representing a callable. *)

open Ctypes

(** GICallableInfo represents an entity which is callable. Currently a function
    (GIFunctionInfo), virtual function, (GIVFuncInfo) or callback
    (GICallbackInfo).
    A callable has a list of arguments (GIArgInfo), a return type, direction
    and a flag which decides if it returns null*)
type t
val callableinfo: t structure typ

(** Does the function throws an error. *)
val can_throw_gerror:
  t structure ptr -> bool

(** Obtain the number of arguments (both IN and OUT) for this callable. *)
val get_n_args:
  t structure ptr -> int

(** Retrieve an arbitrary attribute associated with the return value. *)
val get_return_attribute:
  t structure ptr -> string option

(** Determines if the callable info is a method. For GIVFuncInfos,
    GICallbackInfos, and GISignalInfos, this is always true. Otherwise, this
    looks at the GIFunctionInfo.Is_method flag on the GIFunctionInfo.
    Concretely, this function returns whether GICallableInfo.get_n_args matches
    the number of arguments in the raw C method. For methods, there is one more
    C argument than is exposed by introspection: the "self" or "this" object. *)
val is_method:
  t structure ptr -> bool

(** See if a callable could return NULL.*)
val may_return_null:
  t structure ptr -> bool

(** See if a callable's return value is only useful in C. *)
val skip_return:
  t structure ptr -> bool

(** Obtain information about a particular argument of this callable. *)
val get_arg:
  t structure ptr -> int -> GIArgInfo.t structure ptr

(** Obtain the return type of a callable item as a GITypeInfo. *)
val get_return_type:
  t structure ptr -> GITypeInfo.t structure ptr

(** See whether the caller owns the return value of this callable. GITransfer
    contains a list of possible transfer values. *)
val get_caller_owns:
  t structure ptr -> GIArgInfo.transfer

(*
  TODO : GITransfer	g_callable_info_get_caller_owns ()
  TODO : gboolean	g_callable_info_invoke ()
  TODO : gboolean	g_callable_info_iterate_return_attributes ()
  TODO : void	g_callable_info_load_arg ()
  TODO : void	g_callable_info_load_return_type ()
 *)

(** Just cast OCaml Ctypes base info to callable info. *)
val cast_baseinfo_to_callableinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes callable info to base info *)
val cast_callableinfo_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Return a GIFunctionInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val callableinfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t from a GIFunctionInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_callableinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Just cast OCaml Ctypes function info to callable info. *)
val cast_functioninfo_to_callableinfo:
  GIFunctionInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes callable info to function info *)
val cast_callableinfo_to_functioninfo:
  t structure ptr -> GIFunctionInfo.t structure ptr

(** Return a GIFunctionInfo.t from a GICallableInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val functioninfo_of_callableinfo:
  t structure ptr -> GIFunctionInfo.t structure ptr

(** Return a GIBaseInfo.t from a GIFunctionInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val callableinfo_of_functioninfo:
  GIFunctionInfo.t structure ptr -> t structure ptr

(* GICallableInfo and GIVfuncInfo

(** Just cast OCaml Ctypes vfunc info to callable info. *)
TODO :val cast_vfunc_to_callableinfo:
  GIVFuncInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes callable info to vfunc info *)
TODO :val cast_vfuncinfo_to_baseinfo:
  t structure ptr -> GIVFuncInfo.t structure ptr

(** Return a GIVFuncInfo.t from a GICallableInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
TODO :val vfuncinfo_of_callableinfo:
  t structure ptr -> GIVFuncInfo.t structure ptr

(** Return a GICallableInfo.t from a GIVFuncInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
TODO :val callableinfo_of_vfuncinfo:
  GIVFuncInfo.t structure ptr -> t structure ptr
*)

(* GICallableInfo and GICallbackInfo

(** Just cast OCaml Ctypes callback info to callable info. *)
TODO :val cast_callback_to_callableinfo:
  GICallbackInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes callable info to callback info *)
TODO :val cast_callbackinfo_to_baseinfo:
  t structure ptr -> GICallbackInfo.t structure ptr

(** Return a GICallbackInfo.t from a GICallableInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
TODO :val callbackinfo_of_callableinfo:
  t structure ptr -> GICallbackInfo.t structure ptr

(** Return a GICallableInfo.t from a GICallbackInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
TODO :val callableinfo_of_callbackinfo:
  GICallbackInfo.t structure ptr -> t structure ptr
*)
