open Ctypes
open Foreign
type t
let threadpool : t structure typ = structure "ThreadPool"
let func = field threadpool "func" ()
let user_data = field threadpool "user_data" (ptr void)
let exclusive = field threadpool "exclusive" (bool)
let _ = seal threadpool
