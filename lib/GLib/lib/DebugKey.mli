open Ctypes

type t
val t_typ : t structure typ
val f_key: (string ptr, t structure) field
val f_value: (Unsigned.uint32, t structure) field

