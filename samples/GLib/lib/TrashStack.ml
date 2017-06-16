open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "TrashStack"
let f_next = field t_typ "next" (ptr )
