open Ctypes

type t
val t_typ : t structure typ
val f_status: (Core.once_status, t structure) field
val f_retval: (unit ptr, t structure) field
val init_enter:
t structure ptr -> unit ptr -> bool
val init_leave:
t structure ptr -> unit ptr -> Unsigned.uint64 -> unit

