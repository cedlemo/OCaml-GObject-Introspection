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

let printer attr_name attr_value =
  print_endline (String.concat " " ["\t"; "name :"; attr_name; "value :"; attr_value]);
  true

let flags_to_strings f =
  match f with
  | GIFunctionInfo.Is_method -> print_endline "\tmethod"
  | GIFunctionInfo.Is_constructor -> print_endline "\tconstructor"
  | GIFunctionInfo.Is_getter -> print_endline "\tgetter"
  | GIFunctionInfo.Is_setter -> print_endline "\tsetter"
  | GIFunctionInfo.Wraps_vfunc -> print_endline "\tWraps vfunc"
  | GIFunctionInfo.Throws -> print_endline "\tthrows"

let rec print_flags = function
  | [] -> ()
  | f :: q -> let _ = flags_to_strings f in print_flags q

let print_fn_flags repo namespace n =
  match GIRepository.get_info repo namespace n with
  | None -> let message = String.concat " " ["GIBaseInfo number"; string_of_int n; "unable to be loaded"] in
    print_endline message
  | Some (info) -> match GIBaseInfo.get_type info with
    | GIBaseInfo.Function fn_info -> let name = GIBaseInfo.get_name info in
      let _ = print_endline name in let flags = GIFunctionInfo.get_flags fn_info in
      print_flags flags
    | _ -> ()


let () =
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require (Some repo) namespace in
  let n = GIRepository.get_n_infos (Some repo) namespace in
  for i = 0 to (n - 1) do
    print_fn_flags (Some repo) namespace i;
  done
