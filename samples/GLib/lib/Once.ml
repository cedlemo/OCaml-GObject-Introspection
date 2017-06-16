open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "Once"
let f_status = field t_typ "status" ()
let f_retval = field t_typ "retval" (ptr void)
