open Ctypes

type t
val t_typ : t structure typ
(* TODO Struct field ThreadPool : interface tag not implemented . *)
val f_user_data: (unit ptr, t structure) field
val f_exclusive: (bool, t structure) field
val free:
t structure ptr -> bool -> bool -> unit
val get_max_threads:
t structure ptr -> int32
val get_num_threads:
t structure ptr -> Unsigned.uint32
val move_to_front:
t structure ptr -> unit ptr -> bool
val push:
t structure ptr -> unit ptr -> bool
val set_max_threads:
t structure ptr -> int32 -> bool
val unprocessed:
t structure ptr -> Unsigned.uint32
val get_max_idle_time:
t structure ptr -> Unsigned.uint32
val get_max_unused_threads:
t structure ptr -> int32
val get_num_unused_threads:
t structure ptr -> Unsigned.uint32
val set_max_idle_time:
t structure ptr -> Unsigned.uint32 -> unit
val set_max_unused_threads:
t structure ptr -> int32 -> unit
val stop_unused_threads:
t structure ptr -> unit

