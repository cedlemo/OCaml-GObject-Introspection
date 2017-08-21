
let () =
  let namespace = "GLib" in
  let repo = Repository.get_default () in
  match Repository.require repo namespace () with
  | None -> print_endline "Please provide a good namespace"
  | Some _ -> let n = Repository.get_n_infos repo namespace in
    for i = 0 to n - 1 do
      let info = Repository.get_info repo namespace i in
      let name = match Base_info.get_name info with
        | None -> "Anonymous"
        | Some name -> name
      in let t = Base_info.get_type info in
        let type_name = Base_info.string_of_baseinfo_type t in
      let message = String.concat " : " [type_name; name] in
        print_endline message
    done;
