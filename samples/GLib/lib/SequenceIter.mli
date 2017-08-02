open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_sequence_iter_compare argument types not handled . *)
val get_position:
t structure ptr -> int32
val is_begin:
t structure ptr -> bool
val is_end:
t structure ptr -> bool

