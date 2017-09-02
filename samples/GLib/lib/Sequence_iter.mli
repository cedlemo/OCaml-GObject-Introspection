open Ctypes

type t
val t_typ : t structure typ
val compare:
t structure ptr -> t structure ptr -> int32
val get_position:
t structure ptr -> int32
val is_begin:
t structure ptr -> bool
val is_end:
t structure ptr -> bool

