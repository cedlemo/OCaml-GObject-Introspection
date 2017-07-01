open Ctypes

type t
val t_typ : t structure typ
val f_julian_days: (Unsigned.uint32, t structure) field
val f_julian: (Unsigned.uint32, t structure) field
val f_dmy: (Unsigned.uint32, t structure) field
val f_day: (Unsigned.uint32, t structure) field
val f_month: (Unsigned.uint32, t structure) field
val f_year: (Unsigned.uint32, t structure) field

