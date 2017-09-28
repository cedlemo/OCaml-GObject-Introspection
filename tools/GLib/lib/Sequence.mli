open Ctypes

type t
val t_typ : t structure typ
val free:
t structure ptr -> unit

val get_length:
t structure ptr -> int32

val is_empty:
t structure ptr -> bool

val get:
t structure ptr -> Sequence_iter.t structure ptr -> unit ptr option

val move:
t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit

val move_range:
t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit

val remove:
t structure ptr -> Sequence_iter.t structure ptr -> unit

val remove_range:
t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit

val set:
t structure ptr -> Sequence_iter.t structure ptr -> unit ptr option -> unit

val swap:
t structure ptr -> Sequence_iter.t structure ptr -> Sequence_iter.t structure ptr -> unit


