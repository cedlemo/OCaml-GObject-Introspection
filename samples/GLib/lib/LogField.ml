open Ctypes
open Foreign
type t
let logfield : t structure typ = structure "LogField"
let key = field logfield "key" (ptr string)
let value = field logfield "value" (ptr void)
let length = field logfield "length" (int64_t)
let _ = seal logfield
