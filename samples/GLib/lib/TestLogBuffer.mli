open Ctypes

type t
val t_typ : t structure typ
(* TODO Struct field TestLogBuffer : interface tag not implemented . *)
val f_msgs: (SList.t structure ptr, t structure) field

