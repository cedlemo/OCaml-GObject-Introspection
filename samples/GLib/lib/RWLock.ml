open Ctypes
open Foreign
type t
let rwlock : t structure typ = structure "RWLock"
let p = field rwlock "p" (ptr void)
let i = field rwlock "i" (Array.array)
let _ = seal rwlock
