open Ctypes
type t
val testlogmsg : t structure typ
val log_type: (, t structure) field
val n_strings: (Unsigned.uint32, t structure) field
val strings: (string ptr, t structure) field
val n_nums: (Unsigned.uint32, t structure) field
val nums: (int64 ptr, t structure) field
