open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "MemVTable"
let f_malloc = field t_typ "malloc" ()
let f_realloc = field t_typ "realloc" ()
let f_free = field t_typ "free" ()
let f_calloc = field t_typ "calloc" ()
let f_try_malloc = field t_typ "try_malloc" ()
let f_try_realloc = field t_typ "try_realloc" ()
