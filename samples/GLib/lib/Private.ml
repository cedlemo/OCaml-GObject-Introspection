open Ctypes
open Foreign
type t
let private : t structure typ = structure "Private"
let p = field private "p" (ptr void)
let notify = field private "notify" ()
let future = field private "future" (Array.array)
let _ = seal private
