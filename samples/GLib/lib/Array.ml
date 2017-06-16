open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "Array"
let f_data = field t_typ "data" (ptr string)
let f_len = field t_typ "len" (uint32_t)
