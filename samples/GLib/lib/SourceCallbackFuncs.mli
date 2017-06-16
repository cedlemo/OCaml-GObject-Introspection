open Ctypes
type t
val t_typ : t structure typ
val f_ref: (, t structure) field
val f_unref: (, t structure) field
val f_get: (unit ptr, t structure) field
