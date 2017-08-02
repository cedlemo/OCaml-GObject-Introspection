open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "String"
let f_str = field t_typ "str" (string)
let f_len = field t_typ "len" (uint64_t)
let f_allocated_len = field t_typ "allocated_len" (uint64_t)

