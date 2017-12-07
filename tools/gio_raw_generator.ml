module GI = GObject_introspection
module Base_info = GI.Base_info
module Bind_constant = GI.Bind_constant
module Bind_function = GI.Bind_function
module Binding_utils = GI.Binding_utils
module Constant_info = GI.Constant_info
module Function_info = GI.Function_info
module Loader = GI.Loader
module Types = GI.Types
module Type_info = GI.Type_info

(* This tool is used to  generate the raw bindings of Gio 2 in
 * the OCaml-glib package
 * build with jbuilder build tools/glib_raw_generator.exe
 * launch _build/default/tools/glib_raw_generator.exe
 *)

let print_infos loader =
  let namespace = Loader.get_namespace loader in
  let version = Loader.get_version loader in
  print_endline (">> " ^ namespace);
  print_endline ("\t - version :" ^ version)

let skip = [ ]

let () =
  match Loader.load "Gio" () with
  | None -> print_endline "Please check the namespace, something is wrong"
  | Some loader -> print_infos loader;
    let loader = Loader.set_build_path loader "tools/" in
    Loader.parse loader ~skip ()
