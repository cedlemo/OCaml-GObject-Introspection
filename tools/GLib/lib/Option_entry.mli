open Ctypes

type t
val t_typ : t structure typ
val f_long_name: (string, t structure) field
val f_short_name: (int, t structure) field
val f_flags: (int32, t structure) field
val f_arg: (Option_arg.t, t structure) field
val f_arg_data: (unit ptr, t structure) field
val f_description: (string, t structure) field
val f_arg_description: (string, t structure) field

