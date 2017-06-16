open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "ThreadPool"
let f_func = field t_typ "func" ()
let f_user_data = field t_typ "user_data" (ptr void)
let f_exclusive = field t_typ "exclusive" (bool)
