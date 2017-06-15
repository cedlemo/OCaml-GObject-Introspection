open Ctypes
open Foreign
type t
let timeval : t structure typ = structure "TimeVal"
let tv_sec = field timeval "tv_sec" (int64_t)
let tv_usec = field timeval "tv_usec" (int64_t)
let _ = seal timeval
