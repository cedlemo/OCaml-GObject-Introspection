open Ctypes

type t
val t_typ : t structure typ

val f_pdata: (unit ptr, t structure) field
val f_len: (Unsigned.uint32, t structure) field

