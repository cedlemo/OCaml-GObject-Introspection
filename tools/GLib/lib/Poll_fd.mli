open Ctypes

type t
val t_typ : t structure typ

val f_fd: (int32, t structure) field
val f_events: (Unsigned.uint16, t structure) field
val f_revents: (Unsigned.uint16, t structure) field

