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
type argument = | Arg_in of Binding_utils.type_strings
                | Arg_out of { pre : string; types : Binding_utils.type_strings; post : string }
                | Arg_in_out of { pre : string; types : Binding_utils.type_strings; post : string }

(** The set of arguments of a function. The full set of the arguments must be
    parsed before knowing if we can implement the function hence the Not_implemented
    variant. TODO : remove / replace with func_args.*)
type arguments = | Not_implemented of string
                 | List of argument list

(** When the element types of a function are checked (both from arguments or
    return value, there are three possibilities. *)
type func_types = | Not_handled of string (** One of the argument type is not handled. *)
                  | Skipped of string (** One of the type must be skipped. *)
                  | Type_names of (string * string) list (** Returns a list of tuples (OCaml type, Ctypes type). *)

(** Get a list of the function arguments types, both OCaml types and Ctypes types. *)
val get_arguments_types:
  Callable_info.t structure ptr -> string list -> func_types

(** Get the type names of the return value, both OCaml and Ctypes type names. *)
val get_return_types:
  Callable_info.t structure ptr -> string list -> func_types

val append_ctypes_function_bindings:
  string -> Function_info.t structure ptr -> Binding_utils.Sources.t -> string list -> unit

val append_ctypes_method_bindings:
  string -> Function_info.t structure ptr -> string -> Binding_utils.Sources.t -> unit

val parse_function_info :
  Base_info.t structure ptr -> Binding_utils.Sources.t -> string list -> unit
