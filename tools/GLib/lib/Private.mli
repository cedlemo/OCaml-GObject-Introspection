open Ctypes

type t
val t_typ : t structure typ
val f_p: (unit ptr, t structure) field
(*Struct field Private : callback tag not implemented*)
(*Struct field Private : C Array type for Types.Array tag tag not implemented*)
val get:
  t structure ptr -> unit ptr option

val replace:
  t structure ptr -> unit ptr option -> unit

val set:
  t structure ptr -> unit ptr option -> unit


