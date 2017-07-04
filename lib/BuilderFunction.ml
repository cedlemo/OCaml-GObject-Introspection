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

open BuilderUtils

(* Returns None if there is an out or in/out argument,
 * else returns (string list, string list) whch correspond to
 * the ocaml types of the args for the mli file and the Ctypes for
 * the args for the ml file and the Ctypes functions binding *)
let get_arguments_types callable =
  let n = GICallableInfo.get_n_args callable in
  let rec parse_args index args_types =
    if index = n then Some (List.rev args_types)
    else let arg = GICallableInfo.get_arg callable index in
      match GIArgInfo.get_direction arg with
      | GIArgInfo.In -> let type_info = GIArgInfo.get_type arg in
        let tag = GITypeInfo.get_tag type_info in
        let (ocaml_type, ctypes_typ) = type_tag_to_ctypes_strings tag in
        if ocaml_type = "" || ctypes_typ = "" then None
        else parse_args (index + 1) ((ocaml_type, ctypes_typ) :: args_types)
      | _ -> None
  in parse_args 0 []

let append_ctypes_function_bindings name info (mli, ml) =
  let symbol = GIFunctionInfo.get_symbol info in
  Printf.fprintf mli "(* %s *)" symbol;
  Printf.fprintf ml "(* %s *)" symbol
