open Ctypes
open Foreign
type t
let mutex : t union typ = union "Mutex"
let p = field mutex "p" (ptr void)
let i = field mutex "i" (Array.array)
let _ = seal mutex
