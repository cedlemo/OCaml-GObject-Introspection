open Ctypes
open Foreign
type t
let optioncontext : t structure typ = structure "OptionContext"
let _ = seal optioncontext
