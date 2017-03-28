
let () =
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  let tplib = GIRepository.require repo namespace in
  let c_prefix = GIRepository.get_c_prefix repo namespace in
  let shared_lib = GIRepository.get_shared_library repo namespace in
  let typelib_path = GIRepository.get_typelib_path repo namespace in
  let version = GIRepository.get_version repo namespace in
  print_endline ("Prefix:         " ^ c_prefix);
  print_endline ("Shared library: " ^ shared_lib);
  print_endline ("Typelib path  : " ^ typelib_path);
  print_endline ("Version:        " ^ version);
  let dependencies = GIRepository.get_dependencies repo namespace in
  List.iter (fun x -> print_endline ("\t dep. : " ^ x)) dependencies
