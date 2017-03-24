
let () =
  let repository = GObjectIntrospection.g_irepository_get_default () in
  ignore(GObjectIntrospection.g_irepository_require repository "Gtk")
