open Ctypes

type t
val t_typ : t structure typ
val f_domain: (Unsigned.uint32, t structure) field
val f_code: (int32, t structure) field
val f_message: (string ptr, t structure) field

