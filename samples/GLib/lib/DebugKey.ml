open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "DebugKey"
let f_key = field t_typ "key" (ptr string)
let f_value = field t_typ "value" (uint32_t)
