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

type func_types = | Not_handled of string
                  | Skipped of string
                  | Type_names of (string * string) list

(* Returns None if there is an out or in/out argument,
 * else returns (string list, string list) whch correspond to
 * the ocaml types of the args for the mli file and the Ctypes for
 * the args for the ml file and the Ctypes functions binding *)
let get_arguments_types callable skip_types =
  let n = Callable_info.get_n_args callable in
  if n = 0 then Type_names [("unit", "void")]
  else let rec parse_args index args_types =
         if index = n then Type_names (List.rev args_types)
         else let arg = Callable_info.get_arg callable index in
           match Arg_info.get_direction arg with
           | Arg_info.In -> (
               let type_info = Arg_info.get_type arg in
               let may_be_null = Arg_info.may_be_null arg in
               match Binding_utils.type_info_to_bindings_types type_info may_be_null with
               | Binding_utils.Not_implemented tag_name -> Not_handled tag_name
               | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
                   let types = check_if_types_are_not_from_core (ocaml_type, ctypes_typ) in
                   if Binding_utils.match_one_of ocaml_type skip_types then Skipped ocaml_type
                   else parse_args (index + 1) (types :: args_types)
             )
           | _ -> Not_handled "Arg_info.In or Arg_info.Out"
    in parse_args 0 []

let get_return_types callable skip_types =
  if Callable_info.skip_return callable then Type_names [("unit", "void")]
  else let ret = Callable_info.get_return_type callable in
    let may_be_null = Callable_info.may_return_null callable in
    match Binding_utils.type_info_to_bindings_types ret may_be_null with
    | Binding_utils.Not_implemented tag_name -> Not_handled tag_name
    | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
      if Binding_utils.match_one_of ocaml_type skip_types then Skipped ocaml_type
      else match Callable_info.get_caller_owns callable with
        | Arg_info.Nothing -> let types = check_if_types_are_not_from_core (ocaml_type, ctypes_typ) in
          Type_names [types]
        | Arg_info.Container -> let types = check_if_types_are_not_from_core (ocaml_type, ctypes_typ) in
          Type_names [types]
        | Arg_info.Everything -> let types = check_if_types_are_not_from_core (ocaml_type, ctypes_typ) in
          Type_names [types]

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

let generate_callable_bindings callable name symbol args ret_types sources =
  (* TODO: when dealing with Error.t, make sure to be able to find if the code
          that is generated is for :
            - GLib module (use "Error.t" string)
            - other module (user "GLib.Error.t")
  *)
  (*
    TODO: add a finalizer to allocated error
  example of simple arg out val
  let get_value info =
    let get_value_raw =
      foreign "g_constant_info_get_value"
        (ptr constantinfo @-> ptr Types.argument @-> returning int) in
    let arg_ptr = allocate_n Types.argument ~count:1 in
    let _ = get_value_raw info arg_ptr in
    let _ = Gc.finalise (fun v ->
        info_free_value info v) arg_ptr in
    arg_ptr
   *)
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  let (ocaml_ret, ctypes_ret) = List.hd ret_types in
  if Callable_info.can_throw_gerror callable then (
    let args' = args @ [("Error.t structure ptr option ptr option", "ptr_opt (ptr_opt Error.t_typ)")] in
    let ocaml_ret' = if ocaml_ret = "string" then "string option" else ocaml_ret in
    let ctypes_ret' = if ctypes_ret = "string" then "string_opt" else ctypes_ret in
    File.bprintf mli "val %s:\n  " name;
    File.bprintf mli "%s -> (%s, Error.t structure ptr option) result\n" (String.concat " -> " (List.map (fun (a, b) -> a) args)) ocaml_ret';
    let meaning_less_args = generate_n_meaningless_arg_names (List.length args) in
    File.bprintf ml "let %s %s =\n" name meaning_less_args;
    let name_raw = name ^ "_raw" in
    File.bprintf ml "let %s =\n  foreign \"%s\" " name_raw symbol;
    File.bprintf ml "(%s" (String.concat " @-> " (List.map (fun (a, b) -> b) args'));
    File.bprintf ml " @-> returning (%s))\n" ctypes_ret';
    File.buff_add_line ml "in\nlet err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in";
    File.bprintf ml "let value = %s %s (Some err_ptr_ptr)\nin\n" name_raw meaning_less_args;
    File.buff_add_line ml "match (!@ err_ptr_ptr) with\n\
                             | None -> Ok value\n\
                             | Some _ -> let err_ptr = !@ err_ptr_ptr in\n\
                               let _ = Gc.finalise (function\n\
                                   | Some e -> Error.free e\n\
                                   | None -> () ) err_ptr\n\
                               in\n\
                               Error (err_ptr)"
  ) else (
    File.bprintf mli "val %s:\n  " name;
    File.bprintf ml "let %s =\n  foreign \"%s\" " name symbol;
    File.bprintf mli "%s" (String.concat " -> " (List.map (fun (a, b) -> a) args));
    File.bprintf ml "(%s" (String.concat " @-> " (List.map (fun (a, b) -> b) args));
    File.bprintf mli " -> %s\n" ocaml_ret;
    File.bprintf ml " @-> returning (%s))\n" ctypes_ret
  )

let append_ctypes_function_bindings raw_name info sources skip_types =
  let open Binding_utils in
  let symbol = Function_info.get_symbol info in
  let name = Binding_utils.ensure_valid_variable_name (if raw_name = "" then symbol else raw_name) in
  let callable = Function_info.to_callableinfo info in
  match get_arguments_types callable skip_types with
  | Not_handled t -> let coms = Printf.sprintf "Not implemented %s argument type %s not handled" symbol t in
    Sources.buffs_add_comments sources coms
  | Skipped t ->let coms = Printf.sprintf "%s argument type %s" symbol t in
    Sources.buffs_add_skipped sources coms
  | Type_names args -> match get_return_types callable skip_types with
    | Not_handled t -> let coms = Printf.sprintf "Not implemented %s return type %s not handled" symbol t in
      Sources.buffs_add_comments sources coms
    | Skipped t ->let coms = Printf.sprintf "%s return type %s" symbol t in
      Sources.buffs_add_skipped sources coms
    | Type_names ret_types ->
        generate_callable_bindings callable name symbol args ret_types sources

(* For the methods arguments, we have to check is the argument is of the same
 * type of the container (object, structure or union). *)
let check_if_argument_is_type_of_container container_name (ocaml_type, ctypes_typ) =
  let open Binding_utils in
  let module_pattern = container_name ^ "." in
  let ocaml_type' = string_pattern_remove ocaml_type module_pattern in
  let ctypes_typ' = string_pattern_remove ctypes_typ module_pattern in
  (ocaml_type', ctypes_typ')

(* Given that method (GIFunction with method flags) of a container (object,
 * structure, union ... ) has at least the container type as argument,
 * when GObject_introspection returns no arguments, we just need to add the
 * container types.*)
let get_method_arguments_types callable container skip_types =
  let n = Callable_info.get_n_args callable in
  let rec parse_args index args_types =
    if index = n then Type_names (List.rev args_types)
    else let arg = Callable_info.get_arg callable index in
      match Arg_info.get_direction arg with
      | Arg_info.In -> (
        let type_info = Arg_info.get_type arg in
        let may_be_null = Arg_info.may_be_null arg in
        match Binding_utils.type_info_to_bindings_types type_info may_be_null with
        | Binding_utils.Not_implemented tag_name -> Not_handled tag_name
        | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
          let types = check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ) in
          if Binding_utils.match_one_of ocaml_type skip_types then Skipped ocaml_type
          else parse_args (index + 1) (types :: args_types)
      )
      | _ -> Not_handled "Arg_info.InOut or Arg_info.Out"
   in
   parse_args 0 [("t structure ptr", "ptr t_typ")]

let get_method_return_types callable container skip_types =
  if Callable_info.skip_return callable then Type_names [("unit", "void")]
  else let ret = Callable_info.get_return_type callable in
    let may_be_null = Callable_info.may_return_null callable in
    match Binding_utils.type_info_to_bindings_types ret may_be_null with
    | Binding_utils.Not_implemented tag_name -> Not_handled tag_name
    | Types {ocaml = ocaml_type; ctypes = ctypes_typ} ->
        let types = check_if_argument_is_type_of_container container (ocaml_type, ctypes_typ) in
        if Binding_utils.match_one_of ocaml_type skip_types then Skipped ocaml_type
        else Type_names [types]
      (* TODO : how to free the returned data
      match Callable_info.get_caller_owns callable with
      | Arg_info.Nothing -> ()
      | Arg_info.Container -> ()
      | Arg_info.Everything -> ()
      *)

let append_ctypes_method_bindings raw_name info container sources skip_types =
  let open Binding_utils in
  let symbol = Function_info.get_symbol info in
  let name = Binding_utils.ensure_valid_variable_name (if raw_name = "" then symbol else raw_name) in
  let callable = Function_info.to_callableinfo info in
  match get_method_arguments_types callable container skip_types with
  | Not_handled t -> let coms = Printf.sprintf "Not implemented %s argument type%s not handled" symbol t in
    Sources.buffs_add_comments sources coms
  | Skipped t ->let coms = Printf.sprintf "%s argument type %s" symbol t in
    Sources.buffs_add_skipped sources coms
  | Type_names args -> match get_method_return_types callable container skip_types with
    | Not_handled t -> let coms = Printf.sprintf "Not implemented %s return type %s not handled" symbol t in
      Sources.buffs_add_comments sources coms
    | Skipped t ->let coms = Printf.sprintf "%s return type %s" symbol t in
      Sources.buffs_add_skipped sources coms
    | Type_names ret_types ->
      generate_callable_bindings callable name symbol args ret_types sources;
      Sources.buffs_add_eol sources

let parse_function_info info sources skip_types =
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
     let _ = append_ctypes_function_bindings name info' sources skip_types in
     Binding_utils.Sources.write_buffs sources
