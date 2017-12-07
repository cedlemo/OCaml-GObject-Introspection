open Ctypes

type t
val t_typ : t structure typ

val create:
  string -> Unsigned.uint16 -> Unsigned.uint16 -> Unsigned.uint16 -> t structure ptr

val copy:
  t structure ptr -> t structure ptr

val free:
  t structure ptr -> unit

val get_hostname:
  t structure ptr -> string

val get_port:
  t structure ptr -> Unsigned.uint16

val get_priority:
  t structure ptr -> Unsigned.uint16

val get_weight:
  t structure ptr -> Unsigned.uint16

