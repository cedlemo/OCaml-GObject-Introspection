type repository
type typelib

external get_default:
  unit -> repository = "caml_g_irepository_get_default_c"
external require:
  repository -> string -> typelib = "caml_g_irepository_require_c"
external get_c_prefix:
  repository -> string -> string = "caml_g_irepository_get_c_prefix_c"
