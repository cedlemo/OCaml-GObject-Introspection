type repository
type typelib

external get_default:
  unit -> repository = "caml_g_irepository_get_default_c"
external require:
  repository -> string -> typelib = "caml_g_irepository_require_c"
external get_c_prefix:
  repository -> string -> string = "caml_g_irepository_get_c_prefix_c"
external get_shared_library:
  repository -> string -> string = "caml_g_irepository_get_shared_library_c"
external get_typelib_path:
  repository -> string -> string = "caml_g_irepository_get_typelib_path_c"
external get_version:
  repository -> string -> string = "caml_g_irepository_get_version_c"
