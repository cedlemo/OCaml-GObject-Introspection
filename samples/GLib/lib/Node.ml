open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "Node"
let f_data = field t_typ "data" (ptr void)
let f_next = field t_typ "next" (ptr )
let f_prev = field t_typ "prev" (ptr )
let f_parent = field t_typ "parent" (ptr )
let f_children = field t_typ "children" (ptr )
