open Ctypes

type t
val t_typ : t structure typ
val join:
  t structure ptr -> unit ptr option

val ref:
  t structure ptr -> t structure ptr

val unref:
  t structure ptr -> unit

val error_quark:
  t structure ptr -> Unsigned.uint32

val exit:
  t structure ptr -> unit ptr option -> unit

val self:
  t structure ptr -> t structure ptr

val yield:
  t structure ptr -> unit


