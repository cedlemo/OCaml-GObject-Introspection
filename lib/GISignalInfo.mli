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

(** GISignalInfo — Struct representing a signal. *)

open Ctypes

(** GISignalInfo represents a signal. It's a sub-struct of GICallableInfo and
    contains a set of flags and a class closure.
    See GICallableInfo for information on how to retreive arguments and other
    metadata from the signal. *)
type t
val signalinfo : t structure typ

(** Just cast OCaml Ctypes base info to signal info. *)
val cast_from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes signal info to base info *)
val cast_to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Add unref of the C underlying structure whith Gc.finalise. *)
val add_unref_finaliser:
  t structure ptr -> t structure ptr

(** Return a GISignalInfo.t from a GIBaseInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val from_baseinfo:
  GIBaseInfo.t structure ptr -> t structure ptr

(** Return a GIBaseInfo.t from a GISignalInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val to_baseinfo:
  t structure ptr -> GIBaseInfo.t structure ptr

(** Just cast OCaml Ctypes callable info to signal info. *)
val cast_from_callableinfo:
  GICallableInfo.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes signal info to callable info *)
val cast_to_callableinfo:
  t structure ptr -> GICallableInfo.t structure ptr

(** Return a GISignalInfo.t from a GICallableInfo.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val from_callableinfo:
  GICallableInfo.t structure ptr -> t structure ptr

(** Return a GICallableInfo.t from a GISignalInfo, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    GIBaseInfo.baseinfo_unref. *)
val to_callableinfo:
  t structure ptr -> GICallableInfo.t structure ptr

