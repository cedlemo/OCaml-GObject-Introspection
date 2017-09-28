open Ctypes

type t
val t_typ : t structure typ
val f_log_type: (Test_log_type.t, t structure) field
val f_n_strings: (Unsigned.uint32, t structure) field
val f_strings: (string, t structure) field
val f_n_nums: (Unsigned.uint32, t structure) field
val f_nums: (int64 ptr, t structure) field
val free:
t structure ptr -> unit


