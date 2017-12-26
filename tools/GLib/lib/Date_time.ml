open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Date_time"

let create =
  foreign "g_date_time_new" (ptr Time_zone.t_typ @-> int32_t @-> int32_t @-> int32_t @-> int32_t @-> int32_t @-> double @-> returning (ptr t_typ))
let new_from_timeval_local =
  foreign "g_date_time_new_from_timeval_local" (ptr Time_val.t_typ @-> returning (ptr t_typ))
let new_from_timeval_utc =
  foreign "g_date_time_new_from_timeval_utc" (ptr Time_val.t_typ @-> returning (ptr t_typ))
let new_from_unix_local =
  foreign "g_date_time_new_from_unix_local" (int64_t @-> returning (ptr t_typ))
let new_from_unix_utc =
  foreign "g_date_time_new_from_unix_utc" (int64_t @-> returning (ptr t_typ))
let new_local =
  foreign "g_date_time_new_local" (int32_t @-> int32_t @-> int32_t @-> int32_t @-> int32_t @-> double @-> returning (ptr t_typ))
let new_now =
  foreign "g_date_time_new_now" (ptr Time_zone.t_typ @-> returning (ptr t_typ))
let new_now_local =
  foreign "g_date_time_new_now_local" (void @-> returning (ptr t_typ))
let new_now_utc =
  foreign "g_date_time_new_now_utc" (void @-> returning (ptr t_typ))
let new_utc =
  foreign "g_date_time_new_utc" (int32_t @-> int32_t @-> int32_t @-> int32_t @-> int32_t @-> double @-> returning (ptr t_typ))
let add =
  foreign "g_date_time_add" (ptr t_typ @-> int64_t @-> returning (ptr t_typ))
let add_days =
  foreign "g_date_time_add_days" (ptr t_typ @-> int32_t @-> returning (ptr t_typ))
let add_full =
  foreign "g_date_time_add_full" (ptr t_typ @-> int32_t @-> int32_t @-> int32_t @-> int32_t @-> int32_t @-> double @-> returning (ptr t_typ))
let add_hours =
  foreign "g_date_time_add_hours" (ptr t_typ @-> int32_t @-> returning (ptr t_typ))
let add_minutes =
  foreign "g_date_time_add_minutes" (ptr t_typ @-> int32_t @-> returning (ptr t_typ))
let add_months =
  foreign "g_date_time_add_months" (ptr t_typ @-> int32_t @-> returning (ptr t_typ))
let add_seconds =
  foreign "g_date_time_add_seconds" (ptr t_typ @-> double @-> returning (ptr t_typ))
let add_weeks =
  foreign "g_date_time_add_weeks" (ptr t_typ @-> int32_t @-> returning (ptr t_typ))
let add_years =
  foreign "g_date_time_add_years" (ptr t_typ @-> int32_t @-> returning (ptr t_typ))
let difference =
  foreign "g_date_time_difference" (ptr t_typ @-> ptr Date_time.t_typ @-> returning (int64_t))
let format =
  foreign "g_date_time_format" (ptr t_typ @-> string @-> returning (string))
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
(* Not implemented g_date_time_get_ymd - out argument not handled
(ptr t_typ @-> returning (void * int32_t * int32_t * int32_t))
*)
let is_daylight_savings =
  foreign "g_date_time_is_daylight_savings" (ptr t_typ @-> returning (bool))
let ref =
  foreign "g_date_time_ref" (ptr t_typ @-> returning (ptr t_typ))
let to_local =
  foreign "g_date_time_to_local" (ptr t_typ @-> returning (ptr t_typ))
let to_timeval =
  foreign "g_date_time_to_timeval" (ptr t_typ @-> ptr Time_val.t_typ @-> returning (bool))
let to_timezone =
  foreign "g_date_time_to_timezone" (ptr t_typ @-> ptr Time_zone.t_typ @-> returning (ptr t_typ))
let to_unix =
  foreign "g_date_time_to_unix" (ptr t_typ @-> returning (int64_t))
let to_utc =
  foreign "g_date_time_to_utc" (ptr t_typ @-> returning (ptr t_typ))
let unref =
  foreign "g_date_time_unref" (ptr t_typ @-> returning (void))
let compare =
  foreign "g_date_time_compare" (ptr void @-> ptr void @-> returning (int32_t))
let equal =
  foreign "g_date_time_equal" (ptr void @-> ptr void @-> returning (bool))
let hash =
  foreign "g_date_time_hash" (ptr void @-> returning (uint32_t))
