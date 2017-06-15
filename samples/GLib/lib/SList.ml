open Ctypes
open Foreign
type t
let slist : t structure typ = structure "SList"
let data = field slist "data" (ptr void)
let next = field slist "next" (ptr SList.slist)
let _ = seal slist
