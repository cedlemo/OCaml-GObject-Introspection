
let () =
  let namespace = "GLib" in
  let repo = GIRepository.get_default () in
  match GIRepository.require repo namespace () with
  | None -> print_endline "Please provide a good namespace"
  | Some _ -> let n = GIRepository.get_n_infos repo namespace in
    for i = 0 to n - 1 do
      let info = GIRepository.get_info repo namespace i in
      match GIBaseInfo.get_name info with
      | None -> print_endline "Anonymous"
      | Some name -> print_endline name
    done;
