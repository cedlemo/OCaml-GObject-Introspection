(*
 * Copyright 2017-2019 Cedric LE MOIGNE, cedlemo@gmx.com
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

(** Callable_info — Struct representing a callable. *)

open Ctypes

type t
(** Callable_info represents an entity which is callable. Currently a function
    (Function_info), virtual function, (VFunc_info) or callback
    (GICallbackInfo).
    A callable has a list of arguments (Arg_info), a return type, direction
    and a flag which decides if it returns null*)

val callableinfo : t structure typ

val can_throw_gerror : t structure ptr -> bool
(** Does the function throws an error. *)

val get_n_args : t structure ptr -> int
(** Obtain the number of arguments (both IN and OUT) for this callable. *)

val get_return_attribute : t structure ptr -> string option
(** Retrieve an arbitrary attribute associated with the return value. *)

val is_method : t structure ptr -> bool
(** Determines if the callable info is a method. For VFunc_infos,
    GICallbackInfos, and Signal_infos, this is always true. Otherwise, this
    looks at the Function_info.Is_method flag on the Function_info.
    Concretely, this function returns whether Callable_info.get_n_args matches
    the number of arguments in the raw C method. For methods, there is one more
    C argument than is exposed by introspection: the "self" or "this" object. *)

val may_return_null : t structure ptr -> bool
(** See if a callable could return NULL.*)

val skip_return : t structure ptr -> bool
(** See if a callable's return value is only useful in C. *)

val get_arg : t structure ptr -> int -> Arg_info.t structure ptr
(** Obtain information about a particular argument of this callable. *)

val get_return_type : t structure ptr -> Type_info.t structure ptr
(** Obtain the return type of a callable item as a Type_info. *)

val get_caller_owns : t structure ptr -> Bindings.Arg_info.transfer
(** See whether the caller owns the return value of this callable. GITransfer
    contains a list of possible transfer values. *)

(*
  gboolean	g_callable_info_invoke ()
  gboolean	g_callable_info_iterate_return_attributes ()
  void	g_callable_info_load_arg ()
  void	g_callable_info_load_return_type ()
 *)

val cast_from_baseinfo : Base_info.t structure ptr -> t structure ptr
(** Just cast OCaml Ctypes base info to callable info. *)

val cast_to_baseinfo : t structure ptr -> Base_info.t structure ptr
(** Just cast OCaml Ctypes callable info to base info *)

val add_unref_finaliser : t structure ptr -> t structure ptr
(** Add unref of the C underlying structure whith Gc.finalise. *)

val from_baseinfo : Base_info.t structure ptr -> t structure ptr
(** Return a Function_info.t from a Base_info.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)

val to_baseinfo : t structure ptr -> Base_info.t structure ptr
(** Return a Base_info.t from a Function_info, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)
