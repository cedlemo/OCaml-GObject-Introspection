open Ctypes
open Foreign
type t
let iconv : t structure typ = structure "IConv"
let _ = seal iconv
