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
  t structure ptr -> unit ptr option
val pop_unlocked:
  t structure ptr -> unit ptr option
val push:
  t structure ptr -> unit ptr option -> unit
val push_front:
  t structure ptr -> unit ptr option -> unit
val push_front_unlocked:
  t structure ptr -> unit ptr option -> unit
val push_unlocked:
  t structure ptr -> unit ptr option -> unit
val ref_unlocked:
  t structure ptr -> unit
val remove:
  t structure ptr -> unit ptr option -> bool
val remove_unlocked:
  t structure ptr -> unit ptr option -> bool
val timed_pop:
  t structure ptr -> Time_val.t structure ptr -> unit ptr option
val timed_pop_unlocked:
  t structure ptr -> Time_val.t structure ptr -> unit ptr option
val timeout_pop:
  t structure ptr -> Unsigned.uint64 -> unit ptr option
val timeout_pop_unlocked:
  t structure ptr -> Unsigned.uint64 -> unit ptr option
val try_pop:
  t structure ptr -> unit ptr option
val try_pop_unlocked:
  t structure ptr -> unit ptr option
val unlock:
  t structure ptr -> unit
val unref:
  t structure ptr -> unit
val unref_and_unlock:
  t structure ptr -> unit
