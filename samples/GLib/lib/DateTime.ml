open Ctypes
open Foreign
type t
let datetime : t structure typ = structure "DateTime"
let _ = seal datetime
