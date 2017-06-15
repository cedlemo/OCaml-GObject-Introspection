open Ctypes
open Foreign
type t
let once : t structure typ = structure "Once"
let status = field once "status" ()
let retval = field once "retval" (ptr void)
let _ = seal once
