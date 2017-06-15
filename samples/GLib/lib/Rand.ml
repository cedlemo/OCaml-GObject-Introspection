open Ctypes
open Foreign
type t
let rand : t structure typ = structure "Rand"
let _ = seal rand
