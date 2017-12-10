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

open Ctypes
open Foreign

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

type arg = Not_implemented of string
         | Skipped of string
         | Arg of {name : string; ocaml_type : string; ctypes_type : string; type_info : Type_info.t structure ptr}
type arg_lists = {in_list : arg list; out_list : arg list; in_out_list : arg list}
type args = No_args | Args of arg_lists

let has_out_arg = function
  | No_args -> false
  | Args args -> if List.length args.out_list > 0 then true else false

let has_in_out_arg = function
  | No_args -> false
  | Args args -> if List.length args.in_out_list > 0 then true else false

let has_not_implemented_arg = function
  | No_args -> None
  | Args args ->
    let search =
      List.find_opt (fun a -> match a with
                              | Not_implemented _ -> true
                              | _ -> false)
    in
    match search args.in_list with
    | Some a -> Some a
    | None -> match search args.out_list with
              | Some a -> Some a
              | None -> search args.in_out_list

let has_skipped_arg = function
  | No_args -> None
  | Args args ->
    let search l =
      List.find_opt (fun a -> match a with
                              | Skipped _ -> true
                              | _ -> false) l
    in
    match search args.in_list with
    | Some a -> Some a
    | None -> match search args.out_list with
              | Some a -> Some a
              | None -> search args.in_out_list

(* Get the escaped name (valid OCaml variable name) of the argument. Raise a Failure
 * exception. It is an error to try to get the name of the argument while I should
 * skeep / not implement the function bindings *)
let get_escaped_arg_names =
  List.map (fun a ->
    match a with
    | Not_implemented message -> raise (Failure (Printf.sprintf "get_escaped_arg_names : Not_implemented -> %s" message))
    | Skipped message -> raise (Failure (Printf.sprintf "get_escaped_arg_names : Skipped -> %s" message))
    | Arg arg -> Binding_utils.ensure_valid_variable_name arg.name
)

(* get the OCaml type of an argument and raise an exception if it is not implemented
 * or if it is skipped. *)
let get_ocaml_type = function
  | Not_implemented message -> raise (Failure (Printf.sprintf "get_ocaml_type : Not_implemented -> %s" message))
  | Skipped message -> raise (Failure (Printf.sprintf "get_ocaml_type : Skipped -> %s" message))
  | Arg arg -> arg.ocaml_type

(* get the Ctypes type of an argument and raise an exception if it is not implemented
 * or if it is skipped. *)
let get_ctypes_type = function
  | Not_implemented message -> raise (Failure (Printf.sprintf "get_ocaml_type : Not_implemented -> %s" message))
  | Skipped message -> raise (Failure (Printf.sprintf "get_ocaml_type : Skipped -> %s" message))
  | Arg arg -> arg.ctypes_type

let get_args_information callable skip_types =
  let n = Callable_info.get_n_args callable in
  if n = 0 then No_args
  else (
    let fetch_arg_info arg =
      let type_info = Arg_info.get_type arg in
      let may_be_null = Arg_info.may_be_null arg in
      match Binding_utils.type_info_to_bindings_types type_info may_be_null with
      | Binding_utils.Not_implemented tag_name -> Not_implemented tag_name
      | Types {ocaml = ocaml_type'; ctypes = ctypes_type'} ->
          let (ocaml_type, ctypes_type) = check_if_types_are_not_from_core (ocaml_type', ctypes_type') in
          if Binding_utils.match_one_of ocaml_type skip_types then Skipped ocaml_type
          else let name = ( let info' = Arg_info.to_baseinfo arg in
                            match Base_info.get_name info' with
                            | None -> raise (Failure "It should have a name :Bind_function Arg_info.in")
                            | Some s -> s ) in
          Arg {name; ocaml_type; ctypes_type; type_info}
    in
    let rec _each_arg i {in_list; out_list; in_out_list} =
      if i >= n then {in_list = List.rev in_list;
                     out_list = List.rev out_list;
                     in_out_list = List.rev in_out_list
                    }
      else (
        let arg = Callable_info.get_arg callable i in
           match Arg_info.get_direction arg with
           | Arg_info.In -> _each_arg (i + 1) {in_list = (fetch_arg_info arg) :: in_list; out_list; in_out_list}
           | Arg_info.Out -> _each_arg (i + 1 ) {in_list; out_list = (fetch_arg_info arg) :: out_list; in_out_list}
           | Arg_info.InOut -> _each_arg (i + 1) {in_list; out_list; in_out_list = (fetch_arg_info arg) :: in_out_list}
      )
    in
    let empty_args = {in_list = []; out_list = []; in_out_list = []} in
    Args (_each_arg 0 empty_args)
  )

let log_new_args_type fun_name = function
  | No_args -> Printf.printf "fn - %s : no argument\n" fun_name
  | Args args ->
      let print_arg_list = function
        | [] -> ""
        | l -> let strs = List.map (fun a ->
                              match a with
                              | Not_implemented s -> "Not handled: " ^ s
                              | Skipped s -> "Skipped: " ^ s
                              | Arg {name; ocaml_type; ctypes_type; _ } ->
                                  Printf.sprintf "(arg name) %s : %s | %s" name ocaml_type ctypes_type)
           l in String.concat " -> " strs
     in
     let _ = Printf.printf "fn - %s : (In args ) %s\n" fun_name (print_arg_list args.in_list) in
     let _ = Printf.printf "fn - %s : (Out args) %s\n" fun_name (print_arg_list args.out_list) in
     let _ = Printf.printf "fn - %s : (Out args) %s\n" fun_name (print_arg_list args.in_out_list) in
     print_endline "----------------------------------------------------------------------------------------------"

let test_new_args_data fun_name callable skip_types =
  let args = get_args_information callable skip_types in
  log_new_args_type fun_name args

let generate_callable_bindings callable name symbol args ret_types sources =
  (* TODO: when dealing with Error.t, make sure to be able to find if the code
          that is generated is for :
            - GLib module (use "Error.t" string)
            - other module (user "GLib.Error.t")
  *)
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  let (ocaml_ret, ctypes_ret) = List.hd ret_types in
  if Callable_info.can_throw_gerror callable then (
    let args' = args @ [("Error.t structure ptr option ptr option", "ptr_opt (ptr_opt Error.t_typ)")] in
    let ocaml_ret' = if ocaml_ret = "string" then "string option" else ocaml_ret in
    let ctypes_ret' = if ctypes_ret = "string" then "string_opt" else ctypes_ret in
    let _ = File.bprintf mli "val %s:\n  " name in
    let _ = File.bprintf mli "%s -> (%s, Error.t structure ptr option) result\n" (String.concat " -> " (List.map (fun (a, b) -> a) args)) ocaml_ret' in
    let meaning_less_args = generate_n_meaningless_arg_names (List.length args) in
    let _ = File.bprintf ml "let %s %s =\n" name meaning_less_args in
    let name_raw = name ^ "_raw" in
    let _ = File.bprintf ml "  let %s =\n    foreign \"%s\" " name_raw symbol in
    let _ = File.bprintf ml "(%s" (String.concat " @-> " (List.map (fun (a, b) -> b) args')) in
    let _ = File.bprintf ml " @-> returning (%s))\n  in\n" ctypes_ret' in
    let _ = File.buff_add_line ml "  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in" in
    let _ = File.bprintf ml "  let value = %s %s (Some err_ptr_ptr) in\n" name_raw meaning_less_args in
    let _ = File.buff_add_line ml "  match (!@ err_ptr_ptr) with" in
    let _ = File.buff_add_line ml "   | None -> Ok value" in
    let _ = File.buff_add_line ml "   | Some _ -> let err_ptr = !@ err_ptr_ptr in" in
    let _ = File.buff_add_line ml "     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in" in
    File.buff_add_line ml "     Error (err_ptr)"
  ) else (
    let _ = File.bprintf mli "val %s:\n  " name in
    let _ = File.bprintf ml "let %s =\n  foreign \"%s\" " name symbol in
    let _ = File.bprintf mli "%s" (String.concat " -> " (List.map (fun (a, b) -> a) args)) in
    let _ = File.bprintf ml "(%s" (String.concat " @-> " (List.map (fun (a, b) -> b) args)) in
    let _ = File.bprintf mli " -> %s\n" ocaml_ret in
    File.bprintf ml " @-> returning (%s))\n" ctypes_ret
  )

let generate_callable_bindings_when_only_in_arg callable name symbol arguments ret_types sources =
  let open Binding_utils in
  let mli = Sources.mli sources in
  let ml = Sources.ml sources in
  let (ocaml_ret, ctypes_ret) = List.hd ret_types in
  let _ = File.bprintf mli "val %s:\n  " name in
  if Callable_info.can_throw_gerror callable then (
    let ocaml_ret' = if ocaml_ret = "string" then "string option" else ocaml_ret in
    let ctypes_ret' = if ctypes_ret = "string" then "string_opt" else ctypes_ret in
    let _ = match arguments with
      | No_args ->
        let _ = File.bprintf mli "unit -> (%s, Error.t structure ptr option) result\n" ocaml_ret' in
        let _ = File.bprintf ml "let %s () =\n" name in
        let name_raw = name ^ "_raw" in
        let _ = File.bprintf ml "  let %s =\n    foreign \"%s\" " name_raw symbol in
        let _ = File.bprintf ml "ptr_opt (ptr_opt Error.t_typ) @-> returning (%s))\n  in\n" ctypes_ret' in
        let _ = File.buff_add_line ml "  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in" in
        File.bprintf ml "  let value = %s (Some err_ptr_ptr) in\n" name_raw
      | Args args ->
        let _ = File.bprintf mli "%s -> (%s, Error.t structure ptr option) result\n" (String.concat " -> " (List.map (fun a -> get_ocaml_type a) args.in_list)) ocaml_ret' in
        let arg_names = get_escaped_arg_names args.in_list |> String.concat " " in
        let _ = File.bprintf ml "let %s %s =\n" name arg_names in
        let name_raw = name ^ "_raw" in
        let _ = File.bprintf ml "  let %s =\n    foreign \"%s\" " name_raw symbol in
        let _ = File.bprintf ml "(%s" (String.concat " @-> " (List.map (fun a -> get_ctypes_type a) args.in_list)) in
        let _ = File.bprintf ml "@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (%s))\n  in\n" ctypes_ret' in
        let _ = File.buff_add_line ml "  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in" in
        File.bprintf ml "  let value = %s %s (Some err_ptr_ptr) in\n" name_raw arg_names
    in
    let _ = File.buff_add_line ml "  match (!@ err_ptr_ptr) with" in
    let _ = File.buff_add_line ml "   | None -> Ok value" in
    let _ = File.buff_add_line ml "   | Some _ -> let err_ptr = !@ err_ptr_ptr in" in
    let _ = File.buff_add_line ml "     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in" in
    File.buff_add_line ml "     Error (err_ptr)"
  ) else (
    let _ = File.bprintf ml "let %s =\n  foreign \"%s\" " name symbol in
    let _ = match arguments with
      | No_args -> let _ = File.bprintf mli "%s" "unit" in
        File.bprintf ml "(%s" "void"
      | Args args -> let _ = File.bprintf mli "%s" (String.concat " -> " (List.map (fun a -> get_ocaml_type a) args.in_list)) in
        File.bprintf ml "(%s" (String.concat " @-> " (List.map (fun a -> get_ctypes_type a) args.in_list))
    in
    let _ = File.bprintf mli " -> %s\n" ocaml_ret in
    File.bprintf ml " @-> returning (%s))\n" ctypes_ret
  )

let append_ctypes_function_bindings raw_name info sources skip_types =
  let open Binding_utils in
  let symbol = Function_info.get_symbol info in
  let name = Binding_utils.ensure_valid_variable_name (if raw_name = "" then symbol else raw_name) in
  let callable = Function_info.to_callableinfo info in
  let _ = test_new_args_data name callable skip_types in
  let args = get_args_information callable skip_types in
  let get_info_for_non_usable_arg = function
      | Arg _ -> raise (Failure "get_info_for_non_usable_arg: this should never has been reached")
      | Not_implemented message -> message
      | Skipped message -> message
  in
  match has_not_implemented_arg args with
  | Some arg -> let coms = Printf.sprintf "Not implemented %s type %s not implemented" symbol (get_info_for_non_usable_arg arg) in
    Sources.buffs_add_comments sources coms
  | None -> match has_skipped_arg args with
    | Some arg -> let coms = Printf.sprintf " %s type %s skipped" symbol (get_info_for_non_usable_arg arg) in
      Sources.buffs_add_skipped sources coms
    | None ->
        if has_out_arg args then
          let coms = Printf.sprintf "Not implemented %s - out argument not handled" symbol in
          Sources.buffs_add_comments sources coms
        else if has_in_out_arg args then
          let coms  = Printf.sprintf "Not implemented %s - in out argument not handled" symbol in
          Sources.buffs_add_comments sources coms
        else match get_return_types callable skip_types with
          | Not_handled t ->
              let coms = Printf.sprintf "Not implemented %s return type %s not handled" symbol t in
              Sources.buffs_add_comments sources coms
          | Skipped t ->let coms = Printf.sprintf "%s return type %s" symbol t in
              Sources.buffs_add_skipped sources coms
          | Type_names ret_types ->
              generate_callable_bindings_when_only_in_arg callable name symbol args ret_types sources

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
   let arg_types_list =
     if Callable_info.is_method callable then [("t structure ptr", "ptr t_typ")]
     else [] in
   parse_args 0 arg_types_list

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
  let _ = test_new_args_data name callable skip_types in
  match get_method_arguments_types callable container skip_types with
  | Not_handled t -> let coms = Printf.sprintf "Not implemented %s argument type%s not handled" symbol t in
    Sources.buffs_add_comments sources coms
  | Skipped t ->let coms = Printf.sprintf "%s argument type %s" symbol t in
    Sources.buffs_add_skipped sources coms
  | Type_names args ->
      let args' = match args with | [] -> [("unit", "void")] | _ -> args in
      match get_method_return_types callable container skip_types with
      | Not_handled t -> let coms = Printf.sprintf "Not implemented %s return type %s not handled" symbol t in
        Sources.buffs_add_comments sources coms
      | Skipped t ->let coms = Printf.sprintf "%s return type %s" symbol t in
        Sources.buffs_add_skipped sources coms
      | Type_names ret_types ->
        generate_callable_bindings callable name symbol args' ret_types sources;
        Sources.buffs_add_eol sources

let parse_function_info info sources skip_types =
  let open Binding_utils in
  match Base_info.get_name info with
  | None -> ()
  | Some name ->
     let info' = Function_info.from_baseinfo info in
     let _ = append_ctypes_function_bindings name info' sources skip_types in
     let _ = Sources.buffs_add_eol sources in
     Sources.write_buffs sources
