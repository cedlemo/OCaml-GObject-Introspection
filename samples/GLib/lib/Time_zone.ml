open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Time_zone"
let _new =
foreign "g_time_zone_new" (ptr t_typ @-> string_opt @-> returning (ptr t_typ))
let new_local =
foreign "g_time_zone_new_local" (ptr t_typ @-> returning (ptr t_typ))
let new_utc =
foreign "g_time_zone_new_utc" (ptr t_typ @-> returning (ptr t_typ))
let adjust_time =
foreign "g_time_zone_adjust_time" (ptr t_typ @-> Core.time_type @-> ptr int64_t @-> returning (int32_t))
let find_interval =
foreign "g_time_zone_find_interval" (ptr t_typ @-> Core.time_type @-> int64_t @-> returning (int32_t))
let get_abbreviation =
foreign "g_time_zone_get_abbreviation" (ptr t_typ @-> int32_t @-> returning (string))
let get_offset =
foreign "g_time_zone_get_offset" (ptr t_typ @-> int32_t @-> returning (int32_t))
let is_dst =
foreign "g_time_zone_is_dst" (ptr t_typ @-> int32_t @-> returning (bool))
let ref =
foreign "g_time_zone_ref" (ptr t_typ @-> returning (ptr t_typ))
let unref =
foreign "g_time_zone_unref" (ptr t_typ @-> returning (void))

