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

(** GIArgInfo — Struct representing an argument *)

open Ctypes

(** GIArgInfo represents an argument. An argument is always part of a
    GICallableInfo. *)
type t
val arginfo : t structure typ

(** The direction of a GIArgInfo. *)
type direction =
  | In    (** in argument. *)
  | Out   (** out argument. *)
  | InOut (** in and out argument. *)

(** Obtain the direction of the argument. Check GIDirection for possible
    direction values.*)
val get_direction:
  t structure ptr -> direction

(** Obtain the index of the user data argument. This is only valid for
    arguments which are callbacks. Returns index of the user data argument or
    -1 if there is none. *)
val get_closure:
  t structure ptr -> int
(*
  TODO : gint	g_arg_info_get_destroy ()
  TODO : GITransfer	g_arg_info_get_ownership_transfer ()
  TODO : GIScopeType	g_arg_info_get_scope ()
  TODO : GITypeInfo *	g_arg_info_get_type ()
  TODO : void	g_arg_info_load_type ()
  TODO : gboolean	g_arg_info_may_be_null ()
  TODO : gboolean	g_arg_info_is_caller_allocates ()
  TODO : gboolean	g_arg_info_is_optional ()
  TODO : gboolean	g_arg_info_is_return_value ()
  TODO : gboolean	g_arg_info_is_skip ()
*)

(** Just cast OCaml Ctypes base info to arg info. *)
val cast_baseinfo_to_arginfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes arg info to base info *)
val cast_arginfo_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Add unref of the C underlying structure whith Gc.finalise. *)
val add_unref_finaliser_to_arg_info:
  t structure ptr -> t structure ptr

(** Return a GIArgInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val arginfo_of_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t form a GIArgInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val baseinfo_of_arginfo:
  t structure ptr -> GIBaseInfo.t structure ptr


