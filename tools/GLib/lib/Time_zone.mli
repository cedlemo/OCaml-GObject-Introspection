open Ctypes

type t
val t_typ : t structure typ
val _new:
t structure ptr -> string option -> (* interface *) t structure ptr

val new_local:
t structure ptr -> (* interface *) t structure ptr

val new_utc:
t structure ptr -> (* interface *) t structure ptr

val adjust_time:
t structure ptr -> (* interface *) Time_type.t -> int64 ptr -> int32

val find_interval:
t structure ptr -> (* interface *) Time_type.t -> int64 -> int32

val get_abbreviation:
t structure ptr -> int32 -> string

val get_offset:
t structure ptr -> int32 -> int32

val is_dst:
t structure ptr -> int32 -> bool

val ref:
t structure ptr -> (* interface *) t structure ptr

val unref:
t structure ptr -> unit


