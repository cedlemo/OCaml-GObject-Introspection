type repository
type typelib

external get_default:
  unit -> repository = "caml_g_irepository_get_default_c"
external require:
  repository -> string -> typelib = "caml_g_irepository_require_c"
external get_dependencies:
  repository -> string -> string list = "caml_g_irepository_get_dependencies_c"
external get_immediate_dependencies:
  repository -> string -> string list = "caml_g_irepository_get_immediate_dependencies_c"
external get_n_infos:
  repository -> string -> int = "caml_g_irepository_get_n_infos_c"
external get_loaded_namespaces:
  repository -> string list = "caml_g_irepository_get_loaded_namespaces_c"
external get_c_prefix:
  repository -> string -> string = "caml_g_irepository_get_c_prefix_c"
external enumerate_versions:
  repository -> string -> string list = "caml_g_irepository_enumerate_versions_c"
external prepend_library_path:
  string -> unit = "caml_g_irepository_prepend_library_path_c"
external prepend_search_path:
  string -> unit = "caml_g_irepository_prepend_search_path_c"
external get_shared_library:
  repository -> string -> string = "caml_g_irepository_get_shared_library_c"
external get_search_path:
  unit -> string list = "caml_g_irepository_get_search_path_c"
external get_typelib_path:
  repository -> string -> string = "caml_g_irepository_get_typelib_path_c"
external get_version:
  repository -> string -> string = "caml_g_irepository_get_version_c"
