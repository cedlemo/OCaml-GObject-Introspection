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


(** When the element types of a function are checked (both from arguments or
    return value, there are three possibilities. *)
type func_types = | Not_handled of string (** One of the argument type is not handled. *)
                  | Skipped of string (** One of the type must be skipped. *)
                  | Type_names of (string * string) list (** Returns a list of tuples (OCaml type, Ctypes type). *)

type arg =
         | Not_implemented of string
         | Skipped of string
         | Arg of { name : string;
                    ocaml_type : string;
                    ctypes_type : string;
                    type_info : Type_info.t structure ptr }

type arg_lists = { in_list : arg list;
                   out_list : arg list;
                   in_out_list : arg list}

type args = No_args | Args of arg_lists

(* Get the escaped name (valid OCaml variable name) of the argument. Raise a Failure
 * exception. It is an error to try to get the name of the argument while I should
 * skeep / not implement the function bindings *)
val get_escaped_arg_names :
  arg list -> string list

(* get the OCaml type of an argument and raise an exception if it is not implemented
 * or if it is skipped. *)
val get_ocaml_type :
  arg -> string

(* get the Ctypes type of an argument and raise an exception if it is not implemented
 * or if it is skipped. *)
val get_ctypes_type :
  arg -> string

(** Get a list of the function arguments types, both OCaml types and Ctypes types. *)
val get_args_information:
  Callable_info.t structure ptr -> string list -> args

(** Get the type names of the return value, both OCaml and Ctypes type names. *)
val get_return_types:
  Callable_info.t structure ptr -> string -> string list -> func_types

val append_ctypes_function_bindings:
  string -> Function_info.t structure ptr -> Binding_utils.Sources.t -> string list -> unit

val append_ctypes_method_bindings:
  string -> Function_info.t structure ptr -> string -> Binding_utils.Sources.t -> string list -> unit

val parse_function_info :
  Base_info.t structure ptr -> Binding_utils.Sources.t -> string list -> unit
