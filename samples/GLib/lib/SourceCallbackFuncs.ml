open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "SourceCallbackFuncs"
let f_ref = field t_typ "ref" ()
let f_unref = field t_typ "unref" ()
let f_get = field t_typ "get" (ptr void)
