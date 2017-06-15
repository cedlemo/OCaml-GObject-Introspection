open Ctypes
open Foreign
type t
let thread : t structure typ = structure "Thread"
let _ = seal thread
