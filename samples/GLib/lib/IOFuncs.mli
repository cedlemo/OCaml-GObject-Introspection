open Ctypes
type t
val iofuncs : t structure typ
val io_read: (, t structure) field
val io_write: (, t structure) field
val io_seek: (, t structure) field
val io_close: (, t structure) field
val io_create_watch: (, t structure) field
val io_free: (, t structure) field
val io_set_flags: (, t structure) field
val io_get_flags: (, t structure) field
