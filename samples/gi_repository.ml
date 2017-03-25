
let () =
  let repository = GIRepository.g_irepository_get_default () in
  ignore(GIRepository.g_irepository_require repository "Gtk")
