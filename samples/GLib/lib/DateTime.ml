open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "DateTime"
(* Not implemented g_date_time_new argument types not handled . *)
(* Not implemented g_date_time_new_from_timeval_local argument types not handled . *)
(* Not implemented g_date_time_new_from_timeval_utc argument types not handled . *)
(* Not implemented g_date_time_new_from_unix_local return type not handled . *)
(* Not implemented g_date_time_new_from_unix_utc return type not handled . *)
(* Not implemented g_date_time_new_local return type not handled . *)
(* Not implemented g_date_time_new_now argument types not handled . *)
(* Not implemented g_date_time_new_now_local return type not handled . *)
(* Not implemented g_date_time_new_now_utc return type not handled . *)
(* Not implemented g_date_time_new_utc return type not handled . *)
(* Not implemented g_date_time_add return type not handled . *)
(* Not implemented g_date_time_add_days return type not handled . *)
(* Not implemented g_date_time_add_full return type not handled . *)
(* Not implemented g_date_time_add_hours return type not handled . *)
(* Not implemented g_date_time_add_minutes return type not handled . *)
(* Not implemented g_date_time_add_months return type not handled . *)
(* Not implemented g_date_time_add_seconds return type not handled . *)
(* Not implemented g_date_time_add_weeks return type not handled . *)
(* Not implemented g_date_time_add_years return type not handled . *)
(* Not implemented g_date_time_difference argument types not handled . *)
(* Not implemented g_date_time_format return type not handled . *)
let get_day_of_month =
foreign "g_date_time_get_day_of_month" (ptr t_typ @-> returning (int32_t))
let get_day_of_week =
foreign "g_date_time_get_day_of_week" (ptr t_typ @-> returning (int32_t))
let get_day_of_year =
foreign "g_date_time_get_day_of_year" (ptr t_typ @-> returning (int32_t))
let get_hour =
foreign "g_date_time_get_hour" (ptr t_typ @-> returning (int32_t))
let get_microsecond =
foreign "g_date_time_get_microsecond" (ptr t_typ @-> returning (int32_t))
let get_minute =
foreign "g_date_time_get_minute" (ptr t_typ @-> returning (int32_t))
let get_month =
foreign "g_date_time_get_month" (ptr t_typ @-> returning (int32_t))
let get_second =
foreign "g_date_time_get_second" (ptr t_typ @-> returning (int32_t))
let get_seconds =
foreign "g_date_time_get_seconds" (ptr t_typ @-> returning (double))
let get_timezone_abbreviation =
foreign "g_date_time_get_timezone_abbreviation" (ptr t_typ @-> returning (string))
let get_utc_offset =
foreign "g_date_time_get_utc_offset" (ptr t_typ @-> returning (int64_t))
let get_week_numbering_year =
foreign "g_date_time_get_week_numbering_year" (ptr t_typ @-> returning (int32_t))
let get_week_of_year =
foreign "g_date_time_get_week_of_year" (ptr t_typ @-> returning (int32_t))
let get_year =
foreign "g_date_time_get_year" (ptr t_typ @-> returning (int32_t))
(* Not implemented g_date_time_get_ymd argument types not handled . *)
let is_daylight_savings =
foreign "g_date_time_is_daylight_savings" (ptr t_typ @-> returning (bool))
(* Not implemented g_date_time_ref return type not handled . *)
(* Not implemented g_date_time_to_local return type not handled . *)
(* Not implemented g_date_time_to_timeval argument types not handled . *)
(* Not implemented g_date_time_to_timezone argument types not handled . *)
let to_unix =
foreign "g_date_time_to_unix" (ptr t_typ @-> returning (int64_t))
(* Not implemented g_date_time_to_utc return type not handled . *)
let unref =
foreign "g_date_time_unref" (ptr t_typ @-> returning (void))
let compare =
foreign "g_date_time_compare" (ptr t_typ @-> ptr void @-> ptr void @-> returning (int32_t))
let equal =
foreign "g_date_time_equal" (ptr t_typ @-> ptr void @-> ptr void @-> returning (bool))
let hash =
foreign "g_date_time_hash" (ptr t_typ @-> ptr void @-> returning (uint32_t))

