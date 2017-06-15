open Ctypes
open Foreign
type t
let stringchunk : t structure typ = structure "StringChunk"
let _ = seal stringchunk
