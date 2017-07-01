open Ctypes

type t
val t_typ : t structure typ
val f_head: (List.t structure ptr, t structure) field
val f_tail: (List.t structure ptr, t structure) field
val f_length: (Unsigned.uint32, t structure) field

