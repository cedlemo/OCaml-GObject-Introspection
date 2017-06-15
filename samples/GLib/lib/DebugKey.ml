open Ctypes
open Foreign
type t
let debugkey : t structure typ = structure "DebugKey"
let key = field debugkey "key" (ptr string)
let value = field debugkey "value" (uint32_t)
let _ = seal debugkey
