open Ctypes
type t
val threadpool : t structure typ
val func: (, t structure) field
val user_data: (unit ptr, t structure) field
val exclusive: (bool, t structure) field
