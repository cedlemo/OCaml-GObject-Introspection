open Ctypes

type t
val t_typ : t structure typ
val free:
t structure ptr -> unit
val get_length:
t structure ptr -> int32
val is_empty:
t structure ptr -> bool
(* Not implemented g_sequence_get argument types not handled . *)
(* Not implemented g_sequence_move argument types not handled . *)
(* Not implemented g_sequence_move_range argument types not handled . *)
(* Not implemented g_sequence_remove argument types not handled . *)
(* Not implemented g_sequence_remove_range argument types not handled . *)
(* Not implemented g_sequence_set argument types not handled . *)
(* Not implemented g_sequence_swap argument types not handled . *)

