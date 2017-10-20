open Ctypes

type t
val t_typ : t structure typ
val append:
t structure ptr -> unit ptr option -> Sequence_iter.t structure ptr

val free:
t structure ptr -> unit

val get_begin_iter:
t structure ptr -> Sequence_iter.t structure ptr

val get_end_iter:
t structure ptr -> Sequence_iter.t structure ptr

val get_iter_at_pos:
t structure ptr -> int32 -> Sequence_iter.t structure ptr

val get_length:
t structure ptr -> int32

val is_empty:
t structure ptr -> bool

val prepend:
t structure ptr -> unit ptr option -> Sequence_iter.t structure ptr

val get:
t structure ptr -> Sequence_iter.t structure ptr -> unit ptr option

val insert_before:
t structure ptr -> Sequence_iter.t structure ptr -> unit ptr option -> Sequence_iter.t structure ptr

val move:
t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit

val move_range:
t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit

val range_get_midpoint:
t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr

val remove:
t structure ptr -> Sequence_iter.t structure ptr -> unit

val remove_range:
t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit

val set:
t structure ptr -> Sequence_iter.t structure ptr -> unit ptr option -> unit

val swap:
t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit


