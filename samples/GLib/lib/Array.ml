open Ctypes
open Foreign
type t
let array : t structure typ = structure "Array"
let data = field array "data" (ptr string)
let len = field array "len" (uint32_t)
let _ = seal array
