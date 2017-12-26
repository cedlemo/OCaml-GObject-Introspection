open Ctypes

type t
val t_typ : t structure typ

val clear:
  t structure ptr -> unit
val free:
  t structure ptr -> unit
val insert:
  t structure ptr -> string -> string
val insert_const:
  t structure ptr -> string -> string
val insert_len:
  t structure ptr -> string -> int64 -> string
