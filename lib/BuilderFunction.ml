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

type argument = | Arg_in of BuilderUtils.type_strings
                | Arg_out of { pre : string; types : BuilderUtils.type_strings; post : string }
                | Arg_in_out of { pre : string; types : BuilderUtils.type_strings; post : string }

type arguments = | Not_implemented of string
                 | List of argument list


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
               let b = GIArgInfo.to_baseinfo arg in
               let name = BuilderUtils.Option.value ~default:"nope" (GIBaseInfo.get_name b) in
               let _ = print_endline name in
               let type_info = GIArgInfo.get_type arg in
               let may_be_null = GIArgInfo.may_be_null arg in
               match BuilderUtils.type_info_to_bindings_types type_info may_be_null with
               | BuilderUtils.Not_implemented tag_name -> None
               | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
                 parse_args (index + 1) ((ocaml_type, ctypes_typ) :: args_types)
             )
           | _ -> None
    in parse_args 0 []

let get_return_types callable =
  if GICallableInfo.skip_return callable then Some ("unit", "void")
  else let ret = GICallableInfo.get_return_type callable in
    let may_be_null = GICallableInfo.may_return_null callable in
    match BuilderUtils.type_info_to_bindings_types ret may_be_null with
    | BuilderUtils.Not_implemented tag_name -> None
    | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
      match GICallableInfo.get_caller_owns callable with
      | GIArgInfo.Nothing -> Some (ocaml_type, ctypes_typ)
      | GIArgInfo.Container -> Some (ocaml_type, ctypes_typ)
      | GIArgInfo.Everything -> Some (ocaml_type, ctypes_typ)

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

let append_ctypes_function_bindings raw_name info (mli, ml) =
  let symbol = GIFunctionInfo.get_symbol info in
  let name = BuilderUtils.ensure_valid_variable_name (if raw_name = "" then symbol else raw_name) in
  let callable = GIFunctionInfo.to_callableinfo info in
  match get_arguments_types callable with
  | None -> let coms = Printf.sprintf "Not implemented %s argument types not handled" symbol in
    BuilderUtils.add_comments mli coms;
    BuilderUtils.add_comments ml coms
  | Some args -> match get_return_types callable with
    | None -> let coms = Printf.sprintf "Not implemented %s return type not handled" symbol in
      BuilderUtils.add_comments mli coms;
      BuilderUtils.add_comments ml coms
    | Some (ocaml_ret, ctypes_ret) -> Printf.fprintf mli "val %s:\n" name;
      Printf.fprintf ml "let %s =\nforeign \"%s\" " name symbol;
      Printf.fprintf mli "%s" (String.concat " -> " (List.map (fun (a, b) -> a) args));
      Printf.fprintf ml "(%s" (String.concat " @-> " (List.map (fun (a, b) -> b) args));
      if GICallableInfo.can_throw_gerror callable then (
        Printf.fprintf mli " -> %s" "Error.t structure ptr ptr option";
        Printf.fprintf ml "  @-> %s" "ptr_opt (ptr Error.t_typ)"
      );
      Printf.fprintf mli " -> %s\n" ocaml_ret;
      Printf.fprintf ml " @-> returning (%s))\n" ctypes_ret

(* For the methods arguments, we have to check is the argument is of the same
 * type of the container (object, structure or union). *)
let check_if_argument_is_type_of_container container_name (ocaml_type, ctypes_typ) =
  if (container_name ^ ".t structure") = ocaml_type then ("t structure", "t_typ")
  else if (container_name ^ ".t structure ptr") = ocaml_type then ("t structure ptr", "ptr t_typ")
  else (ocaml_type, ctypes_typ)

(* Given that method (GIFunction with method flags) of a container (object,
 * structure, union ... ) has at least the container type as argument,
 * when GObjectIntrospection returns no arguments, we just need to add the
 * container types.*)
let get_method_arguments_types callable container =
  let n = GICallableInfo.get_n_args callable in
  let rec parse_args index args_types =
    if index = n then Some (List.rev args_types)
    else let arg = GICallableInfo.get_arg callable index in
    match GIArgInfo.get_direction arg with
           | GIArgInfo.In -> (
               let b = GIArgInfo.to_baseinfo arg in
               let name = BuilderUtils.Option.value ~default:"nope" (GIBaseInfo.get_name b) in
               let _ = print_endline name in
             let type_info = GIArgInfo.get_type arg in
             let may_be_null = GIArgInfo.may_be_null arg in
             match BuilderUtils.type_info_to_bindings_types type_info may_be_null with
               | BuilderUtils.Not_implemented tag_name -> None
               | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
                   let types = check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ) in
                   parse_args (index + 1) (types :: args_types)
                   )
               | _ -> None
                   in parse_args 0 [("t structure ptr", "ptr t_typ")]

let get_method_return_types callable container =
  if GICallableInfo.skip_return callable then Some ("unit", "void")
  else let ret = GICallableInfo.get_return_type callable in
    let may_be_null = GICallableInfo.may_return_null callable in
    match BuilderUtils.type_info_to_bindings_types ret may_be_null with
    | BuilderUtils.Not_implemented tag_name -> None
    | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
      match GICallableInfo.get_caller_owns callable with
      | GIArgInfo.Nothing -> Some (check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ))
      | GIArgInfo.Container -> Some (check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ))
      | GIArgInfo.Everything -> Some (check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ))


let append_ctypes_method_bindings raw_name info container (mli, ml) =
  let symbol = GIFunctionInfo.get_symbol info in
  let name = BuilderUtils.ensure_valid_variable_name (if raw_name = "" then symbol else raw_name) in
  let callable = GIFunctionInfo.to_callableinfo info in
  match get_method_arguments_types callable container with
  | None -> let coms = Printf.sprintf "Not implemented %s argument types not handled" symbol in
    BuilderUtils.add_comments mli coms;
    BuilderUtils.add_comments ml coms
  | Some args -> match get_method_return_types callable container with
    | None -> let coms = Printf.sprintf "Not implemented %s return type not handled" symbol in
      BuilderUtils.add_comments mli coms;
      BuilderUtils.add_comments ml coms
    | Some (ocaml_ret, ctypes_ret) -> Printf.fprintf mli "val %s:\n" name;
      Printf.fprintf ml "let %s =\nforeign \"%s\" " name symbol;
      Printf.fprintf mli "%s" (String.concat " -> " (List.map (fun (a, b) -> a) args));
      Printf.fprintf ml "(%s" (String.concat " @-> " (List.map (fun (a, b) -> b) args));
      if GICallableInfo.can_throw_gerror callable then (
        Printf.fprintf mli " -> %s" "Error.t structure ptr ptr option";
        Printf.fprintf ml "  @-> %s" "ptr_opt (ptr Error.t_typ)"
      );
      Printf.fprintf mli " -> %s\n" ocaml_ret;
      Printf.fprintf ml " @-> returning (%s))\n" ctypes_ret

