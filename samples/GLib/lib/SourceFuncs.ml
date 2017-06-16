open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "SourceFuncs"
let f_prepare = field t_typ "prepare" ()
let f_check = field t_typ "check" ()
let f_dispatch = field t_typ "dispatch" (ptr void)
let f_finalize = field t_typ "finalize" ()
let f_closure_callback = field t_typ "closure_callback" ()
let f_closure_marshal = field t_typ "closure_marshal" ()
