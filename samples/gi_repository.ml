
let () =
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  print_endline "Search path";
  let sp = GIRepository.get_search_path () in
  List.iter (fun x -> print_endline ("\t -" ^ x)) sp;
  let _ = GIRepository.require repo namespace in
  let c_prefix = GIRepository.get_c_prefix repo namespace in
  let shared_lib = GIRepository.get_shared_library repo namespace in
  let typelib_path = GIRepository.get_typelib_path repo namespace in
  let version = GIRepository.get_version repo namespace in
  print_endline ("Prefix:         " ^ c_prefix);
  print_endline ("Shared library: " ^ shared_lib);
  print_endline ("Typelib path  : " ^ typelib_path);
  print_endline ("Version:        " ^ version);
  print_endline ("Versions:       ");
  let versions = GIRepository.enumerate_versions repo namespace in
  List.iter (fun x -> print_endline ("\t v. : " ^ x)) versions;
  print_endline "Dependencies";
  let dependencies = GIRepository.get_dependencies repo namespace in
  List.iter (fun x -> print_endline ("\t dep. : " ^ x)) dependencies;
  print_endline "Immediate Dependencies";
(*  let dependencies = GIRepository.get_immediate_dependencies repo namespace in
  List.iter (fun x -> print_endline ("\t dep. : " ^ x)) dependencies; *)
  print_endline "Loaded namespaces";
  let namespaces = GIRepository.get_loaded_namespaces repo in
  List.iter (fun x -> print_endline ("\t namespace : " ^ x)) namespaces;
  let n_infos = GIRepository.get_n_infos repo namespace in
  print_endline ("Number of elements : " ^ (string_of_int n_infos))
