open Ctypes

type t
val t_typ : t structure typ
val _new:
t structure ptr -> Core.checksum_type -> t structure ptr
val copy:
t structure ptr -> t structure ptr
val free:
t structure ptr -> unit
val get_string:
t structure ptr -> string
val reset:
t structure ptr -> unit
(* Not implemented g_checksum_update argument types not handled . *)
val type_get_length:
t structure ptr -> Core.checksum_type -> int64

