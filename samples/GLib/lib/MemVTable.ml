open Ctypes
open Foreign
type t
let memvtable : t structure typ = structure "MemVTable"
let malloc = field memvtable "malloc" ()
let realloc = field memvtable "realloc" ()
let free = field memvtable "free" ()
let calloc = field memvtable "calloc" ()
let try_malloc = field memvtable "try_malloc" ()
let try_realloc = field memvtable "try_realloc" ()
let _ = seal memvtable
