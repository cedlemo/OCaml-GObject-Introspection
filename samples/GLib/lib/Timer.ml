open Ctypes
open Foreign
type t
let timer : t structure typ = structure "Timer"
let _ = seal timer
