open Ctypes

type t
val t_typ : t structure typ

val continue:
  t structure ptr -> unit

val destroy:
  t structure ptr -> unit

val elapsed:
  t structure ptr -> Unsigned.uint64 ptr -> float

val reset:
  t structure ptr -> unit

val start:
  t structure ptr -> unit

val stop:
  t structure ptr -> unit

