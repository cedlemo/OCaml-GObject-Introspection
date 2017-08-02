open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_time_zone_new return type not handled . *)
(* Not implemented g_time_zone_new_local return type not handled . *)
(* Not implemented g_time_zone_new_utc return type not handled . *)
(* Not implemented g_time_zone_adjust_time argument types not handled . *)
(* Not implemented g_time_zone_find_interval argument types not handled . *)
val get_abbreviation:
t structure ptr -> int32 -> string
val get_offset:
t structure ptr -> int32 -> int32
val is_dst:
t structure ptr -> int32 -> bool
(* Not implemented g_time_zone_ref return type not handled . *)
val unref:
t structure ptr -> unit

