open Ctypes

type t
val t_typ : t structure typ

val create:
  Time_zone.t structure ptr -> int32 -> int32 -> int32 -> int32 -> int32 -> float -> t structure ptr
val new_from_timeval_local:
  Time_val.t structure ptr -> t structure ptr
val new_from_timeval_utc:
  Time_val.t structure ptr -> t structure ptr
val new_from_unix_local:
  int64 -> t structure ptr
val new_from_unix_utc:
  int64 -> t structure ptr
val new_local:
  int32 -> int32 -> int32 -> int32 -> int32 -> float -> t structure ptr
val new_now:
  Time_zone.t structure ptr -> t structure ptr
val new_now_local:
  unit -> t structure ptr
val new_now_utc:
  unit -> t structure ptr
val new_utc:
  int32 -> int32 -> int32 -> int32 -> int32 -> float -> t structure ptr
val add:
  t structure ptr -> int64 -> t structure ptr
val add_days:
  t structure ptr -> int32 -> t structure ptr
val add_full:
  t structure ptr -> int32 -> int32 -> int32 -> int32 -> int32 -> float -> t structure ptr
val add_hours:
  t structure ptr -> int32 -> t structure ptr
val add_minutes:
  t structure ptr -> int32 -> t structure ptr
val add_months:
  t structure ptr -> int32 -> t structure ptr
val add_seconds:
  t structure ptr -> float -> t structure ptr
val add_weeks:
  t structure ptr -> int32 -> t structure ptr
val add_years:
  t structure ptr -> int32 -> t structure ptr
val difference:
  t structure ptr -> Date_time.t structure ptr -> int64
val format:
  t structure ptr -> string -> string
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
(* Not implemented g_date_time_get_ymd - out argument not handled
t structure ptr -> (unit, int32, int32, int32)
*)
val is_daylight_savings:
  t structure ptr -> bool
val ref:
  t structure ptr -> t structure ptr
val to_local:
  t structure ptr -> t structure ptr
val to_timeval:
  t structure ptr -> Time_val.t structure ptr -> bool
val to_timezone:
  t structure ptr -> Time_zone.t structure ptr -> t structure ptr
val to_unix:
  t structure ptr -> int64
val to_utc:
  t structure ptr -> t structure ptr
val unref:
  t structure ptr -> unit
val compare:
  unit ptr -> unit ptr -> int32
val equal:
  unit ptr -> unit ptr -> bool
val hash:
  unit ptr -> Unsigned.uint32
