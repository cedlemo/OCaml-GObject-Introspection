open Ctypes
type t
val t_typ : t structure typ
val f_io_read: (, t structure) field
val f_io_write: (, t structure) field
val f_io_seek: (, t structure) field
val f_io_close: (, t structure) field
val f_io_create_watch: (, t structure) field
val f_io_free: (, t structure) field
val f_io_set_flags: (, t structure) field
val f_io_get_flags: (, t structure) field
