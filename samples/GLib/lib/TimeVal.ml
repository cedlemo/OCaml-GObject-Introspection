open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "TimeVal"
let f_tv_sec = field t_typ "tv_sec" (int64_t)
let f_tv_usec = field t_typ "tv_usec" (int64_t)
let add =
foreign "g_time_val_add" (ptr t_typ @-> int64_t @-> returning (void))
(* Not implemented g_time_val_to_iso8601 return type not handled . *)
(* Not implemented g_time_val_from_iso8601 argument types not handled . *)

