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

(** Bind_function : regroups all functions needed to parse and generate the
    OCaml code for functions. *)

open Ctypes
open Foreign

(** Each argument of a function can be represented with this type based on the
    direction of the argument. The Arg_in form is the simpler. The two other forms need to
    provide in the ml file some pre code and post code for the implementation of
    the ctypes bindings.*)
type argument = | Arg_in of Bindings_utils.type_strings
                | Arg_out of { pre : string; types : Bindings_utils.type_strings; post : string }
                | Arg_in_out of { pre : string; types : Bindings_utils.type_strings; post : string }

(** The set of arguments of a function. The full set of the arguments must be
    parsed before knowing if we can implement the function hence the Not_implemented
    variant. *)
type arguments = | Not_implemented of string
                 | List of argument list


val get_arguments_types:
  Callable_info.t structure ptr -> (string * string) list option

val get_return_types:
  Callable_info.t structure ptr -> (string * string) option

val append_ctypes_function_bindings:
  string -> Function_info.t structure ptr -> (Pervasives.out_channel * Pervasives.out_channel) -> unit

val append_ctypes_method_bindings:
  string -> Function_info.t structure ptr -> string -> (Pervasives.out_channel * Pervasives.out_channel) -> unit
