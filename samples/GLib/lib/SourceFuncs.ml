open Ctypes
open Foreign
type t
let sourcefuncs : t structure typ = structure "SourceFuncs"
let prepare = field sourcefuncs "prepare" ()
let check = field sourcefuncs "check" ()
let dispatch = field sourcefuncs "dispatch" (ptr void)
let finalize = field sourcefuncs "finalize" ()
let closure_callback = field sourcefuncs "closure_callback" ()
let closure_marshal = field sourcefuncs "closure_marshal" ()
let _ = seal sourcefuncs
