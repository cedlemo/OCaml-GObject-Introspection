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

let () =
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  print_endline "Search path";
  let sp = GIRepository.get_search_path () in
  List.iter (fun x -> print_endline ("\t -" ^ x)) sp;
  let _ = GIRepository.require (Some repo) namespace in
  let c_prefix = GIRepository.get_c_prefix (Some repo) namespace in
  let shared_lib = GIRepository.get_shared_library (Some repo) namespace in
  let typelib_path = GIRepository.get_typelib_path (Some repo) namespace in
  let version = GIRepository.get_version (Some repo) namespace in
  print_endline ("Prefix:         " ^ c_prefix);
  print_endline ("Shared library: " ^ shared_lib);
  print_endline ("Typelib path  : " ^ typelib_path);
  print_endline ("Version:        " ^ version);
  print_endline ("Versions:       ");
  let versions = GIRepository.enumerate_versions (Some repo) namespace in
  List.iter (fun x -> print_endline ("\t v. : " ^ x)) versions;
  print_endline "Dependencies";
  let dependencies = GIRepository.get_dependencies (Some repo) namespace in
  List.iter (fun x -> print_endline ("\t dep. : " ^ x)) dependencies;
  print_endline "Immediate Dependencies";
(*  let dependencies = GIRepository.get_immediate_dependencies (Some repo) namespace in
  List.iter (fun x -> print_endline ("\t dep. : " ^ x)) dependencies; *)
  print_endline "Loaded namespaces";
  let namespaces = GIRepository.get_loaded_namespaces (Some repo) in
  List.iter (fun x -> print_endline ("\t namespace : " ^ x)) namespaces;
  let n_infos = GIRepository.get_n_infos (Some repo) namespace in
  print_endline ("Number of elements : " ^ (string_of_int n_infos))
