open Ctypes

type t
val t_typ : t structure typ

val get_extension_by_name:
  t structure ptr -> string -> IOExtension.t structure ptr

val get_extensions:
  t structure ptr -> List.t structure ptr

(*Not implemented g_io_extension_point_get_required_type return type gType not handled*)
(*Not implemented g_io_extension_point_set_required_type argument typegType not handled*)
(*Not implemented g_io_extension_point_implement argument typegType not handled*)
val lookup:
  string -> t structure ptr

val register:
  string -> t structure ptr

