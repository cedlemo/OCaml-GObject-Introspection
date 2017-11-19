open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "List"

let f_data = field t_typ "data" (ptr void)
let f_next = field t_typ "next" (ptr t_typ)
let f_prev = field t_typ "prev" (ptr t_typ)
let _ = seal t_typ

