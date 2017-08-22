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

(** Signal_info — Struct representing a signal. *)

open Ctypes

(** Signal_info represents a signal. It's a sub-struct of Callable_info and
    contains a set of flags and a class closure.
    See Callable_info for information on how to retreive arguments and other
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
  | Run_first     (** Invoke the object method handler in the first
                      emission stage. *)
  | Run_last      (** Invoke the object method handler in the third
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

(** Obtain the flags for this signal info. See GSignalFlags for more
    information about possible flag values. *)
val get_flags:
  t structure ptr -> flags list

(** Obtain the class closure for this signal if one is set. The class closure
    is a virtual function on the type that the signal belongs to. If the signal
    lacks a closure None will be returned.
    In order to avoid circular call graph between Signal_info and VFunc_info,
    this function will return a Callable_info. It is upto the user to use
    GIVSignalInfo.from_callableinfo in order to have the VFunc_info.*)
val get_class_closure:
  t structure ptr -> Callable_info.t structure ptr option

(** Just cast OCaml Ctypes base info to signal info. *)
val cast_from_baseinfo:
  Base_info.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes signal info to base info *)
val cast_to_baseinfo:
  t structure ptr -> Base_info.t structure ptr

(** Add unref of the C underlying structure whith Gc.finalise. *)
val add_unref_finaliser:
  t structure ptr -> t structure ptr

(** Return a Signal_info.t from a Base_info.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)
val from_baseinfo:
  Base_info.t structure ptr -> t structure ptr

(** Return a Base_info.t from a Signal_info, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)
val to_baseinfo:
  t structure ptr -> Base_info.t structure ptr

(** Just cast OCaml Ctypes callable info to signal info. *)
val cast_from_callableinfo:
  Callable_info.t structure ptr -> t structure ptr

(** Just cast OCaml Ctypes signal info to callable info *)
val cast_to_callableinfo:
  t structure ptr -> Callable_info.t structure ptr

(** Return a Signal_info.t from a Callable_info.t, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)
val from_callableinfo:
  Callable_info.t structure ptr -> t structure ptr

(** Return a Callable_info.t from a Signal_info, the underlying C structure
    ref count is increased and the value is Gc.finalis"ed" with
    Base_info.baseinfo_unref. *)
val to_callableinfo:
  t structure ptr -> Callable_info.t structure ptr

