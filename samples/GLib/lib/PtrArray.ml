open Ctypes
open Foreign
type t
let ptrarray : t structure typ = structure "PtrArray"
let pdata = field ptrarray "pdata" (ptr void)
let len = field ptrarray "len" (uint32_t)
let _ = seal ptrarray
