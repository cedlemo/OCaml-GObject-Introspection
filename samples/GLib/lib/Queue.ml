open Ctypes
open Foreign
type t
let queue : t structure typ = structure "Queue"
let head = field queue "head" (ptr List.list)
let tail = field queue "tail" (ptr List.list)
let length = field queue "length" (uint32_t)
let _ = seal queue
