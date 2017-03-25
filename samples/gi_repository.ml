
let () =
  let repository = GIRepository.get_default () in
  ignore(GIRepository.require repository "Gtk")
