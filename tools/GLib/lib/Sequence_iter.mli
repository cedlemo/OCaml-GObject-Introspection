open Ctypes

type t
val t_typ : t structure typ
val compare:
t structure ptr -> t structure ptr -> int32

val get_position:
t structure ptr -> int32

val get_sequence:
t structure ptr -> Sequence.t structure ptr

val is_begin:
t structure ptr -> bool

val is_end:
t structure ptr -> bool

val move:
t structure ptr -> int32 -> t structure ptr

val next:
t structure ptr -> t structure ptr

val prev:
t structure ptr -> t structure ptr


