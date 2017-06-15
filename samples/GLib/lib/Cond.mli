open Ctypes
type t
val cond : t structure typ
val p: (unit ptr, t structure) field
val i: (Array.t structure, t structure) field
