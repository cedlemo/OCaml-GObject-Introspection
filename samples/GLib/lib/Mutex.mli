open Ctypes
type t
val mutex : t union typ
val p: (unit ptr, t union) field
val i: (Array.t structure, t union) field
