open Ctypes
open Foreign
type t
let cond : t structure typ = structure "Cond"
let p = field cond "p" (ptr void)
let i = field cond "i" (Array.array)
let _ = seal cond
