open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "SList"
let f_data = field t_typ "data" (ptr void)
let f_next = field t_typ "next" (ptr SList.t_typ)
