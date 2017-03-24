type repo
type gitypelib

external g_irepository_get_default:
  unit -> repo = "caml_g_irepository_get_default_c"
external g_irepository_require:
  repo -> string -> gitypelib = "caml_g_irepository_require_c"
