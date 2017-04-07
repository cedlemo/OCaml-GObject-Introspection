
let printer attr_name attr_value =
  print_endline (String.concat " " ["\t"; "name :"; attr_name; "value :"; attr_value]);
  true

let print_info repo namespace n =
  match GIRepository.get_info repo namespace n with
  | None -> let message = String.concat " " ["GIBaseInfo number"; string_of_int n; "unable to be loaded"] in
    print_endline message
  | Some (info) -> let message = String.concat " " ["GIBaseInfo number"; string_of_int n; GIBaseInfo.get_name info]
  in let _ = print_endline message in
  GIBaseInfo.iterate_over_attributes info printer

let () =
  let namespace = "Gtk" in
  let repo = GIRepository.get_default () in
  let _ = GIRepository.require repo namespace in
  let n = GIRepository.get_n_infos repo namespace in
  for i = 0 to (n - 1) do
    print_info repo namespace i;
  done
