open Ctypes

type t
val t_typ : t structure typ
val f_callback_data: (unit ptr, t structure) field
val f_callback_funcs: ((* interface *) Source_callback_funcs.t structure ptr, t structure) field
val f_source_funcs: ((* interface *) Source_funcs.t structure ptr, t structure) field
val f_ref_count: (Unsigned.uint32, t structure) field
val f_context: ((* interface *) Main_context.t structure ptr, t structure) field
val f_priority: (int32, t structure) field
val f_flags: (Unsigned.uint32, t structure) field
val f_source_id: (Unsigned.uint32, t structure) field
val f_poll_fds: (SList.t structure ptr, t structure) field
val f_prev: ((* interface *) Source.t structure ptr, t structure) field
val f_next: ((* interface *) Source.t structure ptr, t structure) field
val f_name: (string, t structure) field
val f_priv: ((* interface *) Source_private.t structure ptr, t structure) field
val _new:
t structure ptr -> (* interface *) Source_funcs.t structure ptr -> Unsigned.uint32 -> (* interface *) t structure ptr

val add_child_source:
t structure ptr -> (* interface *) t structure ptr -> unit

val add_poll:
t structure ptr -> (* interface *) Poll_fd.t structure ptr -> unit

val add_unix_fd:
t structure ptr -> int32 -> (* interface *) IOCondition.t_list -> unit ptr

val attach:
t structure ptr -> (* interface *) Main_context.t structure ptr option -> Unsigned.uint32

val destroy:
t structure ptr -> unit

val get_can_recurse:
t structure ptr -> bool

val get_context:
t structure ptr -> (* interface *) Main_context.t structure ptr option

val get_current_time:
t structure ptr -> (* interface *) Time_val.t structure ptr -> unit

val get_id:
t structure ptr -> Unsigned.uint32

val get_name:
t structure ptr -> string

val get_priority:
t structure ptr -> int32

val get_ready_time:
t structure ptr -> int64

val get_time:
t structure ptr -> int64

val is_destroyed:
t structure ptr -> bool

val modify_unix_fd:
t structure ptr -> unit ptr -> (* interface *) IOCondition.t_list -> unit

val query_unix_fd:
t structure ptr -> unit ptr -> (* interface *) IOCondition.t_list

val ref:
t structure ptr -> (* interface *) t structure ptr

val remove_child_source:
t structure ptr -> (* interface *) t structure ptr -> unit

val remove_poll:
t structure ptr -> (* interface *) Poll_fd.t structure ptr -> unit

val remove_unix_fd:
t structure ptr -> unit ptr -> unit

(*Not implemented g_source_set_callback argument types not handled*)
val set_callback_indirect:
t structure ptr -> unit ptr option -> (* interface *) Source_callback_funcs.t structure ptr -> unit

val set_can_recurse:
t structure ptr -> bool -> unit

val set_funcs:
t structure ptr -> (* interface *) Source_funcs.t structure ptr -> unit

val set_name:
t structure ptr -> string -> unit

val set_priority:
t structure ptr -> int32 -> unit

val set_ready_time:
t structure ptr -> int64 -> unit

val unref:
t structure ptr -> unit

val remove:
t structure ptr -> Unsigned.uint32 -> bool

val remove_by_funcs_user_data:
t structure ptr -> (* interface *) Source_funcs.t structure ptr -> unit ptr option -> bool

val remove_by_user_data:
t structure ptr -> unit ptr option -> bool

val set_name_by_id:
t structure ptr -> Unsigned.uint32 -> string -> unit


