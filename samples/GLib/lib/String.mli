open Ctypes
type t
val string : t structure typ
val str: (string ptr, t structure) field
val len: (Unsigned.uint64, t structure) field
val allocated_len: (Unsigned.uint64, t structure) field
