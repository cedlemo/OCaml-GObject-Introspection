open Ctypes

type t
val t_typ : t structure typ
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
val get_day_of_month:
t structure ptr -> int32
val get_day_of_week:
t structure ptr -> int32
val get_day_of_year:
t structure ptr -> int32
val get_hour:
t structure ptr -> int32
val get_microsecond:
t structure ptr -> int32
val get_minute:
t structure ptr -> int32
val get_month:
t structure ptr -> int32
val get_second:
t structure ptr -> int32
val get_seconds:
t structure ptr -> float
val get_timezone_abbreviation:
t structure ptr -> string
val get_utc_offset:
t structure ptr -> int64
val get_week_numbering_year:
t structure ptr -> int32
val get_week_of_year:
t structure ptr -> int32
val get_year:
t structure ptr -> int32
(* Not implemented g_date_time_get_ymd argument types not handled . *)
val is_daylight_savings:
t structure ptr -> bool
(* Not implemented g_date_time_ref return type not handled . *)
(* Not implemented g_date_time_to_local return type not handled . *)
(* Not implemented g_date_time_to_timeval argument types not handled . *)
(* Not implemented g_date_time_to_timezone argument types not handled . *)
val to_unix:
t structure ptr -> int64
(* Not implemented g_date_time_to_utc return type not handled . *)
val unref:
t structure ptr -> unit
val compare:
t structure ptr -> unit ptr -> unit ptr -> int32
val equal:
t structure ptr -> unit ptr -> unit ptr -> bool
val hash:
t structure ptr -> unit ptr -> Unsigned.uint32

