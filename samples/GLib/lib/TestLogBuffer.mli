open Ctypes

type t
val t_typ : t structure typ
(* TODO Struct field TestLogBuffer : interface tag not implemented . *)
val f_msgs: (SList.t structure ptr, t structure) field
val free:
t structure ptr -> unit
val push:
t structure ptr -> Unsigned.uint32 -> Unsigned.uint8 ptr -> unit

