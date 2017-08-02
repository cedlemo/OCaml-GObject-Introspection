open Ctypes

type t
val t_typ : t structure typ
val f_key: (string, t structure) field
val f_value: (unit ptr, t structure) field
val f_length: (int64, t structure) field

