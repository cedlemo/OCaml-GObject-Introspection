module GI = GObjectIntrospection

let print_infos loader =
  let namespace = GI.Loader.get_namespace loader in
  let version = GI.Loader.get_version loader in
  print_endline (">> " ^ namespace);
  print_endline ("\t - version :" ^ version)

let () =
  match GI.Loader.load "GLib" () with
  | None -> print_endline "Please check the namespace, something is wrong"
  | Some loader -> print_infos loader;
    let loader = GI.Loader.set_build_path loader "samples" in
    GI.Loader.parse loader ()
