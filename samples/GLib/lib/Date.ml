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
(* Not implemented g_date_new return type not handled . *)
(* Not implemented g_date_new_dmy argument types not handled . *)
(* Not implemented g_date_new_julian return type not handled . *)
let add_days =
foreign "g_date_add_days" (ptr t_typ @-> uint32_t @-> returning (void))
let add_months =
foreign "g_date_add_months" (ptr t_typ @-> uint32_t @-> returning (void))
let add_years =
foreign "g_date_add_years" (ptr t_typ @-> uint32_t @-> returning (void))
(* Not implemented g_date_clamp argument types not handled . *)
let clear =
foreign "g_date_clear" (ptr t_typ @-> uint32_t @-> returning (void))
(* Not implemented g_date_compare argument types not handled . *)
(* Not implemented g_date_days_between argument types not handled . *)
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
(* Not implemented g_date_get_month return type not handled . *)
let get_sunday_week_of_year =
foreign "g_date_get_sunday_week_of_year" (ptr t_typ @-> returning (uint32_t))
(* Not implemented g_date_get_weekday return type not handled . *)
let get_year =
foreign "g_date_get_year" (ptr t_typ @-> returning (uint16_t))
let is_first_of_month =
foreign "g_date_is_first_of_month" (ptr t_typ @-> returning (bool))
let is_last_of_month =
foreign "g_date_is_last_of_month" (ptr t_typ @-> returning (bool))
(* Not implemented g_date_order argument types not handled . *)
let set_day =
foreign "g_date_set_day" (ptr t_typ @-> uint8_t @-> returning (void))
(* Not implemented g_date_set_dmy argument types not handled . *)
let set_julian =
foreign "g_date_set_julian" (ptr t_typ @-> uint32_t @-> returning (void))
(* Not implemented g_date_set_month argument types not handled . *)
let set_parse =
foreign "g_date_set_parse" (ptr t_typ @-> string @-> returning (void))
let set_time =
foreign "g_date_set_time" (ptr t_typ @-> int32_t @-> returning (void))
let set_time_t =
foreign "g_date_set_time_t" (ptr t_typ @-> int64_t @-> returning (void))
(* Not implemented g_date_set_time_val argument types not handled . *)
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
(* Not implemented g_date_get_days_in_month argument types not handled . *)
let get_monday_weeks_in_year =
foreign "g_date_get_monday_weeks_in_year" (ptr t_typ @-> uint16_t @-> returning (uint8_t))
let get_sunday_weeks_in_year =
foreign "g_date_get_sunday_weeks_in_year" (ptr t_typ @-> uint16_t @-> returning (uint8_t))
let is_leap_year =
foreign "g_date_is_leap_year" (ptr t_typ @-> uint16_t @-> returning (bool))
(* Not implemented g_date_strftime argument types not handled . *)
let valid_day =
foreign "g_date_valid_day" (ptr t_typ @-> uint8_t @-> returning (bool))
(* Not implemented g_date_valid_dmy argument types not handled . *)
let valid_julian =
foreign "g_date_valid_julian" (ptr t_typ @-> uint32_t @-> returning (bool))
(* Not implemented g_date_valid_month argument types not handled . *)
(* Not implemented g_date_valid_weekday argument types not handled . *)
let valid_year =
foreign "g_date_valid_year" (ptr t_typ @-> uint16_t @-> returning (bool))

