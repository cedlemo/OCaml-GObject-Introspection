open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Queue"
let f_head = field t_typ "head" (ptr List.t_typ)
let f_tail = field t_typ "tail" (ptr List.t_typ)
let f_length = field t_typ "length" (uint32_t)

