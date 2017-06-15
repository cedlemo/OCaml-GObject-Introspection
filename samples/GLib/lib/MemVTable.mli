open Ctypes
type t
val memvtable : t structure typ
val malloc: (, t structure) field
val realloc: (, t structure) field
val free: (, t structure) field
val calloc: (, t structure) field
val try_malloc: (, t structure) field
val try_realloc: (, t structure) field
