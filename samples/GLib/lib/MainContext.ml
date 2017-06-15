open Ctypes
open Foreign
type t
let maincontext : t structure typ = structure "MainContext"
let _ = seal maincontext
