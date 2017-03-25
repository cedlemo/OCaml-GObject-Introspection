
let () =
  let repo = GIRepository.get_default () in
  let tplib = GIRepository.require repo "Gtk" in
  let c_prefix = GIRepository.get_c_prefix repo "Gtk" in
  print_endline c_prefix
