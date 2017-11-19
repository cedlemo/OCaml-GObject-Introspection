open Ctypes

type t
val t_typ : t structure typ

val f_p: (unit ptr, t structure) field
(*Struct field Rec_mutex : C Array type for Types.Array tag tag not implemented*)

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

