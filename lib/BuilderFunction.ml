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
  if n = 0 then Some [("unit", "void")]
  else let rec parse_args index args_types =
         if index = n then Some (List.rev args_types)
         else let arg = GICallableInfo.get_arg callable index in
           match GIArgInfo.get_direction arg with
           | GIArgInfo.In -> (
               let type_info = GIArgInfo.get_type arg in
               let tag = GITypeInfo.get_tag type_info in
               match BuilderUtils.type_tag_to_bindings_types tag with
               | BuilderUtils.Not_implemented tag_name -> None
               | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
                 parse_args (index + 1) ((ocaml_type, ctypes_typ) :: args_types)
             )
           | _ -> None
    in parse_args 0 []

let get_return_types callable =
  if GICallableInfo.skip_return callable then Some ("unit", "void")
  else let ret = GICallableInfo.get_return_type callable in
    let tag = GITypeInfo.get_tag ret in
    let (ocaml_type, ctypes_typ) = type_tag_to_ctypes_strings tag in
    if ocaml_type = "" || ctypes_typ = "" then None
    else match GICallableInfo.get_caller_owns callable with
      | GIArgInfo.Nothing -> Some (ocaml_type, ctypes_typ)
      | _ -> None

(* Build function bindings :
 * - get the GICallableInfo
 * - find out the numbers of arguments
 *   - for each argument :
 *     - get the direction :
 *       - in
 *       - out
 *       - in/out
 *     - get the transfert method
 *       - nothing
 *       - container
 *       - everything
 *     - get the GITypeInfo
 *       - get the Tag (scalar data or complex data)
 *     - find out if it is a pointer
 *)
let append_ctypes_function_bindings name info (mli, ml) =
  let symbol = GIFunctionInfo.get_symbol info in
  let callable = GIFunctionInfo.to_callableinfo info in
  match get_arguments_types callable with
  | None -> Printf.fprintf mli "(* Not implemented %s argument types not handled *)" symbol;
    Printf.fprintf ml "(* Not implemented %s argument types not handled *)" symbol
  | Some args -> match get_return_types callable with
    | None -> Printf.fprintf mli "(* Not implemented %s return type not handled *)" symbol;
      Printf.fprintf ml "(* Not implemented %s argument types not handled *)" symbol
    | Some (ocaml_ret, ctypes_ret) -> Printf.fprintf mli "val %s:\n" name;
      Printf.fprintf ml "let %s =\nforeign \"%s\" " name symbol;
      Printf.fprintf mli "%s" (String.concat " -> " (List.map (fun (a, b) -> a) args));
      Printf.fprintf ml "(%s" (String.concat " @-> " (List.map (fun (a, b) -> b) args));
      Printf.fprintf mli " -> %s\n" ocaml_ret;
      Printf.fprintf ml " @-> returning %s)\n" ctypes_ret

