open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "SourceFuncs"
let f_dispatch = field t_typ "dispatch" (ptr void)

