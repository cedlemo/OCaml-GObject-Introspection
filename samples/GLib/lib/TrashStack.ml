open Ctypes
open Foreign
type t
let trashstack : t structure typ = structure "TrashStack"
let next = field trashstack "next" (ptr )
let _ = seal trashstack
