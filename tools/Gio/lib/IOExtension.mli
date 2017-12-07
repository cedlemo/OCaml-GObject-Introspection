open Ctypes

type t
val t_typ : t structure typ

val get_name:
  t structure ptr -> string

val get_priority:
  t structure ptr -> int32

(*Not implemented g_io_extension_get_type return type gType not handled*)
