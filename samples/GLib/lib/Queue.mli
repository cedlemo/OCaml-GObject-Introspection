open Ctypes

type t
val t_typ : t structure typ
val f_head: (List.t structure ptr, t structure) field
val f_tail: (List.t structure ptr, t structure) field
val f_length: (Unsigned.uint32, t structure) field
val clear:
t structure ptr -> unit
val free:
t structure ptr -> unit
(* Not implemented g_queue_free_full argument types not handled . *)
val get_length:
t structure ptr -> Unsigned.uint32
val index:
t structure ptr -> unit ptr -> int32
val init:
t structure ptr -> unit
val is_empty:
t structure ptr -> bool
val peek_head:
t structure ptr -> unit ptr
val peek_nth:
t structure ptr -> Unsigned.uint32 -> unit ptr
val peek_tail:
t structure ptr -> unit ptr
val pop_head:
t structure ptr -> unit ptr
val pop_nth:
t structure ptr -> Unsigned.uint32 -> unit ptr
val pop_tail:
t structure ptr -> unit ptr
val push_head:
t structure ptr -> unit ptr -> unit
val push_nth:
t structure ptr -> unit ptr -> int32 -> unit
val push_tail:
t structure ptr -> unit ptr -> unit
val remove:
t structure ptr -> unit ptr -> bool
val remove_all:
t structure ptr -> unit ptr -> Unsigned.uint32
val reverse:
t structure ptr -> unit

