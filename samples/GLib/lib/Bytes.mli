open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_bytes_new argument types not handled . *)
(* Not implemented g_bytes_new_take argument types not handled . *)
(* Not implemented g_bytes_compare argument types not handled . *)
(* Not implemented g_bytes_equal argument types not handled . *)
(* Not implemented g_bytes_get_data argument types not handled . *)
val get_size:
t structure ptr -> Unsigned.uint64
val hash:
t structure ptr -> Unsigned.uint32
(* Not implemented g_bytes_new_from_bytes return type not handled . *)
(* Not implemented g_bytes_ref return type not handled . *)
val unref:
t structure ptr -> unit
(* Not implemented g_bytes_unref_to_array return type not handled . *)
(* Not implemented g_bytes_unref_to_data argument types not handled . *)

