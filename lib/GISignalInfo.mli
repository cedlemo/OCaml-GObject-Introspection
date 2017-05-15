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

(** Obtain if the returning true in the signal handler will stop the emission
    of the signal. *)
val true_stops_emit:
  t structure ptr -> bool

(** The signal flags are used to specify a signal's behaviour, the overall
    signal description outlines how especially the RUN flags control the stages
    of a signal emission. *)
type flags =
  | First         (** Invoke the object method handler in the first
                      emission stage. *)
  | Last          (** Invoke the object method handler in the third
                      emission stage. *)
  | Run_cleanup   (** Invoke the object method handler in the last
                      emission stage. *)
  | No_recurse    (** Signals being emitted for an object while currently
                      being in emission for this very object will not be
                      emitted recursively, but instead cause the first
                      emission to be restarted. *)
  | Detailed      (** This signal supports "::detail" appendices to the
                      signal name upon handler connections and emissions. *)
  | Action        (** Action signals are signals that may freely be
                      emitted on alive objects from user code via
                      g_signal_emit() and friends, without the need of
                      being embedded into extra code that performs pre or
                      post emission adjustments on the object. They can
                      also be thought of as object methods which can be
                      called generically by third-party code. *)
  | No_hooks      (** No emissions hooks are supported for this signal. *)
  | Must_collect  (** Varargs signal emission will always collect the
                      arguments, even if there are no signal handlers
                      connected. Since 2.30. *)
  | Deprecated    (** The signal is deprecated and will be removed in a
                      future version. A warning will be generated if it is
                      connected while running with G_ENABLE_DIAGNOSTIC=1.
                      Since 2.32. *)
(*
  TODO : GSignalFlags	g_signal_info_get_flags ()
  TODO : GIVFuncInfo *	g_signal_info_get_class_closure ()
 *)

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

