open Ctypes
open Foreign
type t
let bytes : t structure typ = structure "Bytes"
let _ = seal bytes
