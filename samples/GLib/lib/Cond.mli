open Ctypes

type t
val t_typ : t structure typ
val f_p: (unit ptr, t structure) field
(* TODO Struct field Cond : C Array type for Types.Array tag tag not implemented . *)
val broadcast:
t structure ptr -> unit
val clear:
t structure ptr -> unit
val init:
t structure ptr -> unit
val signal:
t structure ptr -> unit
(* Not implemented g_cond_wait argument types not handled . *)
(* Not implemented g_cond_wait_until argument types not handled . *)

