open Ctypes

type t
val t_typ : t structure typ

val block:
  t structure ptr -> string -> unit

val free:
  t structure ptr -> unit

