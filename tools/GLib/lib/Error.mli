open Ctypes

type t
val t_typ : t structure typ
val f_domain: (Unsigned.uint32, t structure) field
val f_code: (int32, t structure) field
val f_message: (string, t structure) field
val new_literal:
  t structure ptr -> Unsigned.uint32 -> int32 -> string -> t structure ptr

val copy:
  t structure ptr -> t structure ptr

val free:
  t structure ptr -> unit

val matches:
  t structure ptr -> Unsigned.uint32 -> int32 -> bool


