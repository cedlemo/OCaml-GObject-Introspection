open Ctypes
type t
val t_typ : t structure typ
val f_malloc: (, t structure) field
val f_realloc: (, t structure) field
val f_free: (, t structure) field
val f_calloc: (, t structure) field
val f_try_malloc: (, t structure) field
val f_try_realloc: (, t structure) field
