open Ctypes
type t
val sourcecallbackfuncs : t structure typ
val ref: (, t structure) field
val unref: (, t structure) field
val get: (unit ptr, t structure) field
