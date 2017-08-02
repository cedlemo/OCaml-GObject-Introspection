open Ctypes

type t
val t_typ : t structure typ
val clear:
t structure ptr -> unit
val free:
t structure ptr -> unit
(* Not implemented g_string_chunk_insert return type not handled . *)
(* Not implemented g_string_chunk_insert_const return type not handled . *)
(* Not implemented g_string_chunk_insert_len return type not handled . *)

