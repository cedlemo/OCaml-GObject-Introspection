open Ctypes
open Foreign
type t
let tree : t structure typ = structure "Tree"
let _ = seal tree
