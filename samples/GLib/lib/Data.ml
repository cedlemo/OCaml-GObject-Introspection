open Ctypes
open Foreign
type t
let data : t structure typ = structure "Data"
let _ = seal data
