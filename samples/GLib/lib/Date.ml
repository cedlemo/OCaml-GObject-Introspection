open Ctypes
open Foreign
type t
let date : t structure typ = structure "Date"
let julian_days = field date "julian_days" (uint32_t)
let julian = field date "julian" (uint32_t)
let dmy = field date "dmy" (uint32_t)
let day = field date "day" (uint32_t)
let month = field date "month" (uint32_t)
let year = field date "year" (uint32_t)
let _ = seal date
