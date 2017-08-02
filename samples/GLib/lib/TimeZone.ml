open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "TimeZone"
(* Not implemented g_time_zone_new return type not handled . *)
(* Not implemented g_time_zone_new_local return type not handled . *)
(* Not implemented g_time_zone_new_utc return type not handled . *)
(* Not implemented g_time_zone_adjust_time argument types not handled . *)
(* Not implemented g_time_zone_find_interval argument types not handled . *)
let get_abbreviation =
foreign "g_time_zone_get_abbreviation" (ptr t_typ @-> int32_t @-> returning (string))
let get_offset =
foreign "g_time_zone_get_offset" (ptr t_typ @-> int32_t @-> returning (int32_t))
let is_dst =
foreign "g_time_zone_is_dst" (ptr t_typ @-> int32_t @-> returning (bool))
(* Not implemented g_time_zone_ref return type not handled . *)
let unref =
foreign "g_time_zone_unref" (ptr t_typ @-> returning (void))

