open Ctypes
open Foreign
type t
let recmutex : t structure typ = structure "RecMutex"
let p = field recmutex "p" (ptr void)
let i = field recmutex "i" (Array.array)
let _ = seal recmutex
