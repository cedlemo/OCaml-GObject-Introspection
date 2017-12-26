open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Time_val"

let f_tv_sec = field t_typ "tv_sec" (int64_t)
let f_tv_usec = field t_typ "tv_usec" (int64_t)
let _ = seal t_typ

let add =
  foreign "g_time_val_add" (ptr t_typ @-> int64_t @-> returning (void))
let to_iso8601 =
  foreign "g_time_val_to_iso8601" (ptr t_typ @-> returning (string_opt))
(* Not implemented g_time_val_from_iso8601 - out argument not handled
(string @-> returning (bool * Time_val.t_typ))
*)
