open Ctypes

type t
val t_typ : t structure typ

val f_error_code: (int32, t structure) field
val f_dbus_error_name: (string, t structure) field

