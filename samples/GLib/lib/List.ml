open Ctypes
open Foreign
type t
let list : t structure typ = structure "List"
let data = field list "data" (ptr void)
let next = field list "next" (ptr List.list)
let prev = field list "prev" (ptr List.list)
let _ = seal list
