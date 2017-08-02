open Ctypes

type t
val t_typ : t structure typ
(* TODO Struct field Once : interface tag not implemented . *)
val f_retval: (unit ptr, t structure) field
val init_enter:
t structure ptr -> unit ptr -> bool
val init_leave:
t structure ptr -> unit ptr -> Unsigned.uint64 -> unit

