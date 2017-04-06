let print_info repo namespace n =
  let message =
  match GIRepository.get_info repo namespace n with
  | None -> String.concat " " ["GIBaseInfo number"; string_of_int n; "unable to be loaded"]
  | Some (info) -> String.concat " " ["GIBaseInfo number"; string_of_int n; GIBaseInfo.get_name info]
  in print_endline message

let () =
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require repo namespace in
  print_info repo namespace 10;
  print_info repo namespace 15;
  print_info repo namespace 20
