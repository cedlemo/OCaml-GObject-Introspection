open Ctypes
type t
val array : t structure typ
val data: (string ptr, t structure) field
val len: (Unsigned.uint32, t structure) field
