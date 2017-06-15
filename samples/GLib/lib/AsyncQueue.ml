open Ctypes
open Foreign
type t
let asyncqueue : t structure typ = structure "AsyncQueue"
let _ = seal asyncqueue
