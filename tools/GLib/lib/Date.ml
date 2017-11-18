open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Date"
let f_julian_days = field t_typ "julian_days" (uint32_t)
let f_julian = field t_typ "julian" (uint32_t)
let f_dmy = field t_typ "dmy" (uint32_t)
let f_day = field t_typ "day" (uint32_t)
let f_month = field t_typ "month" (uint32_t)
let f_year = field t_typ "year" (uint32_t)
let _ = seal t_typ
let _new =
  foreign "g_date_new" (void @-> returning (ptr t_typ))

let new_dmy =
  foreign "g_date_new_dmy" (void @-> uint8_t @-> Date_month.t_view @-> uint16_t @-> returning (ptr t_typ))

let new_julian =
  foreign "g_date_new_julian" (void @-> uint32_t @-> returning (ptr t_typ))

let add_days =
  foreign "g_date_add_days" (ptr t_typ @-> uint32_t @-> returning (void))

let add_months =
  foreign "g_date_add_months" (ptr t_typ @-> uint32_t @-> returning (void))

let add_years =
  foreign "g_date_add_years" (ptr t_typ @-> uint32_t @-> returning (void))

let clamp =
  foreign "g_date_clamp" (ptr t_typ @-> ptr t_typ @-> ptr t_typ @-> returning (void))

let clear =
  foreign "g_date_clear" (ptr t_typ @-> uint32_t @-> returning (void))

let compare =
  foreign "g_date_compare" (ptr t_typ @-> ptr t_typ @-> returning (int32_t))

let days_between =
  foreign "g_date_days_between" (ptr t_typ @-> ptr t_typ @-> returning (int32_t))

let free =
  foreign "g_date_free" (ptr t_typ @-> returning (void))

let get_day =
  foreign "g_date_get_day" (ptr t_typ @-> returning (uint8_t))

let get_day_of_year =
  foreign "g_date_get_day_of_year" (ptr t_typ @-> returning (uint32_t))

let get_iso8601_week_of_year =
  foreign "g_date_get_iso8601_week_of_year" (ptr t_typ @-> returning (uint32_t))

let get_julian =
  foreign "g_date_get_julian" (ptr t_typ @-> returning (uint32_t))

let get_monday_week_of_year =
  foreign "g_date_get_monday_week_of_year" (ptr t_typ @-> returning (uint32_t))

let get_month =
  foreign "g_date_get_month" (ptr t_typ @-> returning (Date_month.t_view))

let get_sunday_week_of_year =
  foreign "g_date_get_sunday_week_of_year" (ptr t_typ @-> returning (uint32_t))

let get_weekday =
  foreign "g_date_get_weekday" (ptr t_typ @-> returning (Date_weekday.t_view))

let get_year =
  foreign "g_date_get_year" (ptr t_typ @-> returning (uint16_t))

let is_first_of_month =
  foreign "g_date_is_first_of_month" (ptr t_typ @-> returning (bool))

let is_last_of_month =
  foreign "g_date_is_last_of_month" (ptr t_typ @-> returning (bool))

let order =
  foreign "g_date_order" (ptr t_typ @-> ptr t_typ @-> returning (void))

let set_day =
  foreign "g_date_set_day" (ptr t_typ @-> uint8_t @-> returning (void))

let set_dmy =
  foreign "g_date_set_dmy" (ptr t_typ @-> uint8_t @-> Date_month.t_view @-> uint16_t @-> returning (void))

let set_julian =
  foreign "g_date_set_julian" (ptr t_typ @-> uint32_t @-> returning (void))

let set_month =
  foreign "g_date_set_month" (ptr t_typ @-> Date_month.t_view @-> returning (void))

let set_parse =
  foreign "g_date_set_parse" (ptr t_typ @-> string @-> returning (void))

let set_time =
  foreign "g_date_set_time" (ptr t_typ @-> int32_t @-> returning (void))

let set_time_t =
  foreign "g_date_set_time_t" (ptr t_typ @-> int64_t @-> returning (void))

let set_time_val =
  foreign "g_date_set_time_val" (ptr t_typ @-> ptr Time_val.t_typ @-> returning (void))

let set_year =
  foreign "g_date_set_year" (ptr t_typ @-> uint16_t @-> returning (void))

let subtract_days =
  foreign "g_date_subtract_days" (ptr t_typ @-> uint32_t @-> returning (void))

let subtract_months =
  foreign "g_date_subtract_months" (ptr t_typ @-> uint32_t @-> returning (void))

let subtract_years =
  foreign "g_date_subtract_years" (ptr t_typ @-> uint32_t @-> returning (void))

let to_struct_tm =
  foreign "g_date_to_struct_tm" (ptr t_typ @-> ptr void @-> returning (void))

let valid =
  foreign "g_date_valid" (ptr t_typ @-> returning (bool))

let get_days_in_month =
  foreign "g_date_get_days_in_month" (void @-> Date_month.t_view @-> uint16_t @-> returning (uint8_t))

let get_monday_weeks_in_year =
  foreign "g_date_get_monday_weeks_in_year" (void @-> uint16_t @-> returning (uint8_t))

let get_sunday_weeks_in_year =
  foreign "g_date_get_sunday_weeks_in_year" (void @-> uint16_t @-> returning (uint8_t))

let is_leap_year =
  foreign "g_date_is_leap_year" (void @-> uint16_t @-> returning (bool))

let strftime =
  foreign "g_date_strftime" (void @-> string @-> uint64_t @-> string @-> ptr t_typ @-> returning (uint64_t))

let valid_day =
  foreign "g_date_valid_day" (void @-> uint8_t @-> returning (bool))

let valid_dmy =
  foreign "g_date_valid_dmy" (void @-> uint8_t @-> Date_month.t_view @-> uint16_t @-> returning (bool))

let valid_julian =
  foreign "g_date_valid_julian" (void @-> uint32_t @-> returning (bool))

let valid_month =
  foreign "g_date_valid_month" (void @-> Date_month.t_view @-> returning (bool))

let valid_weekday =
  foreign "g_date_valid_weekday" (void @-> Date_weekday.t_view @-> returning (bool))

let valid_year =
  foreign "g_date_valid_year" (void @-> uint16_t @-> returning (bool))


