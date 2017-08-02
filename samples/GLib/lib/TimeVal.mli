open Ctypes

type t
val t_typ : t structure typ
val f_tv_sec: (int64, t structure) field
val f_tv_usec: (int64, t structure) field
val add:
t structure ptr -> int64 -> unit
(* Not implemented g_time_val_to_iso8601 return type not handled . *)
(* Not implemented g_time_val_from_iso8601 argument types not handled . *)

