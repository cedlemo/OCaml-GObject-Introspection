open Ctypes
type t
val t_typ : t structure typ
val f_str: (string ptr, t structure) field
val f_len: (Unsigned.uint64, t structure) field
val f_allocated_len: (Unsigned.uint64, t structure) field
