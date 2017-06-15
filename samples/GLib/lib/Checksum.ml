open Ctypes
open Foreign
type t
let checksum : t structure typ = structure "Checksum"
let _ = seal checksum
