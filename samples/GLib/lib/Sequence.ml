open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Sequence"
let free =
foreign "g_sequence_free" (ptr t_typ @-> returning (void))
let get_length =
foreign "g_sequence_get_length" (ptr t_typ @-> returning (int32_t))
let is_empty =
foreign "g_sequence_is_empty" (ptr t_typ @-> returning (bool))
(* Not implemented g_sequence_get argument types not handled . *)
(* Not implemented g_sequence_move argument types not handled . *)
(* Not implemented g_sequence_move_range argument types not handled . *)
(* Not implemented g_sequence_remove argument types not handled . *)
(* Not implemented g_sequence_remove_range argument types not handled . *)
(* Not implemented g_sequence_set argument types not handled . *)
(* Not implemented g_sequence_swap argument types not handled . *)

