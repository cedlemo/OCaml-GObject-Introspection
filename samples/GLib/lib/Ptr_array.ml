open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Ptr_array"
let f_pdata = field t_typ "pdata" (ptr void)
let f_len = field t_typ "len" (uint32_t)

