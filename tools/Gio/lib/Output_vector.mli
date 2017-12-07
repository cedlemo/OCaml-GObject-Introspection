open Ctypes

type t
val t_typ : t structure typ

val f_buffer: (unit ptr, t structure) field
val f_size: (Unsigned.uint64, t structure) field

