open Ctypes
open Foreign
type t
let string : t structure typ = structure "String"
let str = field string "str" (ptr string)
let len = field string "len" (uint64_t)
let allocated_len = field string "allocated_len" (uint64_t)
let _ = seal string
