open Ctypes
open Foreign
type t
let statbuf : t structure typ = structure "StatBuf"
let _ = seal statbuf
