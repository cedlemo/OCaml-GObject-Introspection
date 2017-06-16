open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "IOFuncs"
let f_io_read = field t_typ "io_read" ()
let f_io_write = field t_typ "io_write" ()
let f_io_seek = field t_typ "io_seek" ()
let f_io_close = field t_typ "io_close" ()
let f_io_create_watch = field t_typ "io_create_watch" ()
let f_io_free = field t_typ "io_free" ()
let f_io_set_flags = field t_typ "io_set_flags" ()
let f_io_get_flags = field t_typ "io_get_flags" ()
