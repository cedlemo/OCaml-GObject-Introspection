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


type argument = | Arg_in of Binding_utils.type_strings
                | Arg_out of { pre : string; types : Binding_utils.type_strings; post : string }
                | Arg_in_out of { pre : string; types : Binding_utils.type_strings; post : string }

type arguments = | Not_implemented of string
                 | List of argument list


let check_if_types_are_not_from_core (ocaml_type, ctypes_typ) =
  let ocaml_type' = Binding_utils.string_pattern_remove ocaml_type "Core." in
  let ctypes_typ' = Binding_utils.string_pattern_remove ctypes_typ "Core." in
  (ocaml_type', ctypes_typ')

(* Returns None if there is an out or in/out argument,
 * else returns (string list, string list) whch correspond to
 * the ocaml types of the args for the mli file and the Ctypes for
 * the args for the ml file and the Ctypes functions binding *)
let get_arguments_types callable =
  let n = Callable_info.get_n_args callable in
  if n = 0 then Some [("unit", "void")]
  else let rec parse_args index args_types =
         if index = n then Some (List.rev args_types)
         else let arg = Callable_info.get_arg callable index in
           match Arg_info.get_direction arg with
           | Arg_info.In -> (
               let type_info = Arg_info.get_type arg in
               let may_be_null = Arg_info.may_be_null arg in
               match Binding_utils.type_info_to_bindings_types type_info may_be_null with
               | Binding_utils.Not_implemented tag_name -> None
               | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
                   let types = check_if_types_are_not_from_core (ocaml_type, ctypes_typ) in
                 parse_args (index + 1) (types :: args_types)
             )
           | _ -> None
    in parse_args 0 []

let get_return_types callable =
  if Callable_info.skip_return callable then Some ("unit", "void")
  else let ret = Callable_info.get_return_type callable in
    let may_be_null = Callable_info.may_return_null callable in
    match Binding_utils.type_info_to_bindings_types ret may_be_null with
    | Binding_utils.Not_implemented tag_name -> None
    | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
      match Callable_info.get_caller_owns callable with
      | Arg_info.Nothing -> let types = check_if_types_are_not_from_core (ocaml_type, ctypes_typ) in
      Some types
      | Arg_info.Container -> let types = check_if_types_are_not_from_core (ocaml_type, ctypes_typ) in
      Some types
      | Arg_info.Everything -> let types = check_if_types_are_not_from_core (ocaml_type, ctypes_typ) in
      Some types


(* Build function bindings :
 * - get the Callable_info
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
 *     - get the Type_info
 *       - get the Tag (scalar data or complex data)
 *     - find out if it is a pointer
 *)

let append_ctypes_function_bindings raw_name info sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let mli_descr = File.descr mli in
  let ml = Sources.ml sources in
  let ml_descr = File.descr ml in
  let symbol = Function_info.get_symbol info in
  let name = Binding_utils.ensure_valid_variable_name (if raw_name = "" then symbol else raw_name) in
  let callable = Function_info.to_callableinfo info in
  match get_arguments_types callable with
  | None -> let coms = Printf.sprintf "Not implemented %s argument types not handled" symbol in
    Binding_utils.File.add_comments mli coms;
    Binding_utils.File.add_comments ml coms
  | Some args -> match get_return_types callable with
    | None -> let coms = Printf.sprintf "Not implemented %s return type not handled" symbol in
      Binding_utils.File.add_comments mli coms;
      Binding_utils.File.add_comments ml coms
    | Some (ocaml_ret, ctypes_ret) -> Printf.fprintf mli_descr "val %s:\n" name;
      Printf.fprintf ml_descr "let %s =\nforeign \"%s\" " name symbol;
      Printf.fprintf mli_descr "%s" (String.concat " -> " (List.map (fun (a, b) -> a) args));
      Printf.fprintf ml_descr "(%s" (String.concat " @-> " (List.map (fun (a, b) -> b) args));
      if Callable_info.can_throw_gerror callable then (
        Printf.fprintf mli_descr " -> %s" "Error.t structure ptr ptr option";
        Printf.fprintf ml_descr "  @-> %s" "ptr_opt (ptr Error.t_typ)"
      );
      Printf.fprintf mli_descr " -> %s\n" ocaml_ret;
      Printf.fprintf ml_descr " @-> returning (%s))\n" ctypes_ret

(* For the methods arguments, we have to check is the argument is of the same
 * type of the container (object, structure or union). *)
let check_if_argument_is_type_of_container container_name (ocaml_type, ctypes_typ) =
  let module_pattern = container_name ^ "." in
  let ocaml_type' = Binding_utils.string_pattern_remove ocaml_type module_pattern in
  let ctypes_typ' = Binding_utils.string_pattern_remove ctypes_typ module_pattern in
  (ocaml_type', ctypes_typ')

(* Given that method (GIFunction with method flags) of a container (object,
 * structure, union ... ) has at least the container type as argument,
 * when GObject_introspection returns no arguments, we just need to add the
 * container types.*)
let get_method_arguments_types callable container =
  let n = Callable_info.get_n_args callable in
  let rec parse_args index args_types =
    if index = n then Some (List.rev args_types)
    else let arg = Callable_info.get_arg callable index in
    match Arg_info.get_direction arg with
           | Arg_info.In -> (
             let type_info = Arg_info.get_type arg in
             let may_be_null = Arg_info.may_be_null arg in
             match Binding_utils.type_info_to_bindings_types type_info may_be_null with
               | Binding_utils.Not_implemented tag_name -> None
               | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
                   let types = check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ) in
                   parse_args (index + 1) (types :: args_types)
                   )
               | _ -> None
                   in parse_args 0 [("t structure ptr", "ptr t_typ")]

let get_method_return_types callable container =
  if Callable_info.skip_return callable then Some ("unit", "void")
  else let ret = Callable_info.get_return_type callable in
    let may_be_null = Callable_info.may_return_null callable in
    match Binding_utils.type_info_to_bindings_types ret may_be_null with
    | Binding_utils.Not_implemented tag_name -> None
    | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
      match Callable_info.get_caller_owns callable with
      | Arg_info.Nothing -> Some (check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ))
      | Arg_info.Container -> Some (check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ))
      | Arg_info.Everything -> Some (check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ))

let append_ctypes_method_bindings raw_name info container sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let mli_descr = File.descr mli in
  let ml = Sources.ml sources in
  let ml_descr = File.descr ml in
  let symbol = Function_info.get_symbol info in
  let name = Binding_utils.ensure_valid_variable_name (if raw_name = "" then symbol else raw_name) in
  let callable = Function_info.to_callableinfo info in
  match get_method_arguments_types callable container with
  | None -> let coms = Printf.sprintf "Not implemented %s argument types not handled" symbol in
    File.add_comments mli coms;
    File.add_comments ml coms
  | Some args -> match get_method_return_types callable container with
    | None -> let coms = Printf.sprintf "Not implemented %s return type not handled" symbol in
      File.add_comments mli coms;
      File.add_comments ml coms
    | Some (ocaml_ret, ctypes_ret) -> Printf.fprintf mli_descr "val %s:\n" name;
      Printf.fprintf ml_descr "let %s =\nforeign \"%s\" " name symbol;
      Printf.fprintf mli_descr "%s" (String.concat " -> " (List.map (fun (a, b) -> a) args));
      Printf.fprintf ml_descr "(%s" (String.concat " @-> " (List.map (fun (a, b) -> b) args));
      if Callable_info.can_throw_gerror callable then (
        Printf.fprintf mli_descr " -> %s" "Error.t structure ptr ptr option";
        Printf.fprintf ml_descr "  @-> %s" "ptr_opt (ptr Error.t_typ)"
      );
      Printf.fprintf mli_descr " -> %s\n" ocaml_ret;
      Printf.fprintf ml_descr " @-> returning (%s))\n" ctypes_ret

let parse_function_info info sources =
  match Base_info.get_name info with
  | None -> ()
  | Some name -> let _ = match Base_info.get_container info with
   | None -> ()
   | Some container -> match Base_info.get_name container with
     | None -> ()
     | Some container_name -> print_endline (String.concat " " ["Container :";
                                                                container_name;
                                                                "function";
                                                                name])
     in
     let info' = Function_info.from_baseinfo info in
     let flags = Function_info.get_flags info' in
     let rec search = function
      | [] -> true
      | f :: q -> if f == Function_info.Is_method then false
      else search q
     in
      if search flags then (
        let _ = append_ctypes_function_bindings name info' sources in
        let mli = Binding_utils.Sources.mli sources in
        let ml = Binding_utils.Sources.ml sources in
        let _ = Binding_utils.File.add_empty_line mli in
        Binding_utils.File.add_empty_line ml
    )
