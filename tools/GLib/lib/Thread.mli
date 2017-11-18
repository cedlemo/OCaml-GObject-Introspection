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
  unit -> Unsigned.uint32

val exit:
  unit -> unit ptr option -> unit

val self:
  unit -> t structure ptr

val yield:
  unit -> unit


