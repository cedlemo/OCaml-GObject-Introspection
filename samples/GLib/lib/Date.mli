open Ctypes
type t
val date : t structure typ
val julian_days: (Unsigned.uint32, t structure) field
val julian: (Unsigned.uint32, t structure) field
val dmy: (Unsigned.uint32, t structure) field
val day: (Unsigned.uint32, t structure) field
val month: (Unsigned.uint32, t structure) field
val year: (Unsigned.uint32, t structure) field
