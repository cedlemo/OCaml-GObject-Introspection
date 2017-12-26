open Ctypes

type t
val t_typ : t structure typ

val f_status: (Once_status.t, t structure) field
val f_retval: (unit ptr, t structure) field

val init_enter:
  unit ptr -> bool
val init_leave:
  unit ptr -> Unsigned.uint64 -> unit
