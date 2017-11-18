open Ctypes

type t
val t_typ : t structure typ
val f_julian_days: (Unsigned.uint32, t structure) field
val f_julian: (Unsigned.uint32, t structure) field
val f_dmy: (Unsigned.uint32, t structure) field
val f_day: (Unsigned.uint32, t structure) field
val f_month: (Unsigned.uint32, t structure) field
val f_year: (Unsigned.uint32, t structure) field
val _new:
  unit -> t structure ptr

val new_dmy:
  unit -> Unsigned.uint8 -> Date_month.t -> Unsigned.uint16 -> t structure ptr

val new_julian:
  unit -> Unsigned.uint32 -> t structure ptr

val add_days:
  t structure ptr -> Unsigned.uint32 -> unit

val add_months:
  t structure ptr -> Unsigned.uint32 -> unit

val add_years:
  t structure ptr -> Unsigned.uint32 -> unit

val clamp:
  t structure ptr -> t structure ptr -> t structure ptr -> unit

val clear:
  t structure ptr -> Unsigned.uint32 -> unit

val compare:
  t structure ptr -> t structure ptr -> int32

val days_between:
  t structure ptr -> t structure ptr -> int32

val free:
  t structure ptr -> unit

val get_day:
  t structure ptr -> Unsigned.uint8

val get_day_of_year:
  t structure ptr -> Unsigned.uint32

val get_iso8601_week_of_year:
  t structure ptr -> Unsigned.uint32

val get_julian:
  t structure ptr -> Unsigned.uint32

val get_monday_week_of_year:
  t structure ptr -> Unsigned.uint32

val get_month:
  t structure ptr -> Date_month.t

val get_sunday_week_of_year:
  t structure ptr -> Unsigned.uint32

val get_weekday:
  t structure ptr -> Date_weekday.t

val get_year:
  t structure ptr -> Unsigned.uint16

val is_first_of_month:
  t structure ptr -> bool

val is_last_of_month:
  t structure ptr -> bool

val order:
  t structure ptr -> t structure ptr -> unit

val set_day:
  t structure ptr -> Unsigned.uint8 -> unit

val set_dmy:
  t structure ptr -> Unsigned.uint8 -> Date_month.t -> Unsigned.uint16 -> unit

val set_julian:
  t structure ptr -> Unsigned.uint32 -> unit

val set_month:
  t structure ptr -> Date_month.t -> unit

val set_parse:
  t structure ptr -> string -> unit

val set_time:
  t structure ptr -> int32 -> unit

val set_time_t:
  t structure ptr -> int64 -> unit

val set_time_val:
  t structure ptr -> Time_val.t structure ptr -> unit

val set_year:
  t structure ptr -> Unsigned.uint16 -> unit

val subtract_days:
  t structure ptr -> Unsigned.uint32 -> unit

val subtract_months:
  t structure ptr -> Unsigned.uint32 -> unit

val subtract_years:
  t structure ptr -> Unsigned.uint32 -> unit

val to_struct_tm:
  t structure ptr -> unit ptr -> unit

val valid:
  t structure ptr -> bool

val get_days_in_month:
  unit -> Date_month.t -> Unsigned.uint16 -> Unsigned.uint8

val get_monday_weeks_in_year:
  unit -> Unsigned.uint16 -> Unsigned.uint8

val get_sunday_weeks_in_year:
  unit -> Unsigned.uint16 -> Unsigned.uint8

val is_leap_year:
  unit -> Unsigned.uint16 -> bool

val strftime:
  unit -> string -> Unsigned.uint64 -> string -> t structure ptr -> Unsigned.uint64

val valid_day:
  unit -> Unsigned.uint8 -> bool

val valid_dmy:
  unit -> Unsigned.uint8 -> Date_month.t -> Unsigned.uint16 -> bool

val valid_julian:
  unit -> Unsigned.uint32 -> bool

val valid_month:
  unit -> Date_month.t -> bool

val valid_weekday:
  unit -> Date_weekday.t -> bool

val valid_year:
  unit -> Unsigned.uint16 -> bool


