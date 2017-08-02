open Ctypes

type t
val t_typ : t structure typ
val length:
t structure ptr -> int32
val length_unlocked:
t structure ptr -> int32
val lock:
t structure ptr -> unit
val pop:
t structure ptr -> unit ptr
val pop_unlocked:
t structure ptr -> unit ptr
val push:
t structure ptr -> unit ptr -> unit
val push_front:
t structure ptr -> unit ptr -> unit
val push_front_unlocked:
t structure ptr -> unit ptr -> unit
val push_unlocked:
t structure ptr -> unit ptr -> unit
val ref_unlocked:
t structure ptr -> unit
val remove:
t structure ptr -> unit ptr -> bool
val remove_unlocked:
t structure ptr -> unit ptr -> bool
(* Not implemented g_async_queue_timed_pop argument types not handled . *)
(* Not implemented g_async_queue_timed_pop_unlocked argument types not handled . *)
val timeout_pop:
t structure ptr -> Unsigned.uint64 -> unit ptr
val timeout_pop_unlocked:
t structure ptr -> Unsigned.uint64 -> unit ptr
val try_pop:
t structure ptr -> unit ptr
val try_pop_unlocked:
t structure ptr -> unit ptr
val unlock:
t structure ptr -> unit
val unref:
t structure ptr -> unit
val unref_and_unlock:
t structure ptr -> unit

