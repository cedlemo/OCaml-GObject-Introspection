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
