open Ctypes
open Foreign
type t
let dir : t structure typ = structure "Dir"
let _ = seal dir
