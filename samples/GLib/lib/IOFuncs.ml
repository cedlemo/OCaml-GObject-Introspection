open Ctypes
open Foreign
type t
let iofuncs : t structure typ = structure "IOFuncs"
let io_read = field iofuncs "io_read" ()
let io_write = field iofuncs "io_write" ()
let io_seek = field iofuncs "io_seek" ()
let io_close = field iofuncs "io_close" ()
let io_create_watch = field iofuncs "io_create_watch" ()
let io_free = field iofuncs "io_free" ()
let io_set_flags = field iofuncs "io_set_flags" ()
let io_get_flags = field iofuncs "io_get_flags" ()
let _ = seal iofuncs
