open Ctypes
open Foreign
type t
let node : t structure typ = structure "Node"
let data = field node "data" (ptr void)
let next = field node "next" (ptr )
let prev = field node "prev" (ptr )
let parent = field node "parent" (ptr )
let children = field node "children" (ptr )
let _ = seal node
