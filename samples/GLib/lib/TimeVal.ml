open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "TimeVal"
let f_tv_sec = field t_typ "tv_sec" (int64_t)
let f_tv_usec = field t_typ "tv_usec" (int64_t)
