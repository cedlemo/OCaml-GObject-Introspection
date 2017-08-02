open Ctypes

type t
val t_typ : t structure typ
val f_p: (unit ptr, t structure) field
(* TODO Struct field RecMutex : C Array type for GITypes.Array tag tag not implemented . *)
val clear:
t structure ptr -> unit
val init:
t structure ptr -> unit
val lock:
t structure ptr -> unit
val trylock:
t structure ptr -> bool
val unlock:
t structure ptr -> unit

