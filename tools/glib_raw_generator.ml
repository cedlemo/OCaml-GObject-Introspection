module GI = GObject_introspection

(* This tool is used to  generate the raw bindings of GLib 2 in
 * the OCaml-glib package
 * build with jbuilder build tools/glib_raw_generator.exe
 * launch _build/default/tools/glib_raw_generator.exe
 *)

let print_infos loader =
  let namespace = GI.Loader.get_namespace loader in
  let version = GI.Loader.get_version loader in
  print_endline (">> " ^ namespace);
  print_endline ("\t - version :" ^ version)

let skip = [ "Hook";
]

let () =
  match GI.Loader.load "GLib" () with
  | None -> print_endline "Please check the namespace, something is wrong"
  | Some loader -> print_infos loader;
    let loader = GI.Loader.set_build_path loader "tools/" in
    GI.Loader.parse loader ~skip ()
