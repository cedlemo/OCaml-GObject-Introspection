open Ctypes

type t
val t_typ : t structure typ
val f_callback_data: (unit ptr, t structure) field
(* TODO Struct field Source : interface tag not implemented . *)
(* TODO Struct field Source : interface tag not implemented . *)
val f_ref_count: (Unsigned.uint32, t structure) field
(* TODO Struct field Source : interface tag not implemented . *)
val f_priority: (int32, t structure) field
val f_flags: (Unsigned.uint32, t structure) field
val f_source_id: (Unsigned.uint32, t structure) field
val f_poll_fds: (SList.t structure ptr, t structure) field
(* TODO Struct field Source : interface tag not implemented . *)
(* TODO Struct field Source : interface tag not implemented . *)
val f_name: (string, t structure) field
(* TODO Struct field Source : interface tag not implemented . *)
(* Not implemented g_source_new argument types not handled . *)
(* Not implemented g_source_add_child_source argument types not handled . *)
(* Not implemented g_source_add_poll argument types not handled . *)
(* Not implemented g_source_add_unix_fd argument types not handled . *)
(* Not implemented g_source_attach argument types not handled . *)
val destroy:
t structure ptr -> unit
val get_can_recurse:
t structure ptr -> bool
(* Not implemented g_source_get_context return type not handled . *)
(* Not implemented g_source_get_current_time argument types not handled . *)
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
(* Not implemented g_source_modify_unix_fd argument types not handled . *)
(* Not implemented g_source_query_unix_fd return type not handled . *)
(* Not implemented g_source_ref return type not handled . *)
(* Not implemented g_source_remove_child_source argument types not handled . *)
(* Not implemented g_source_remove_poll argument types not handled . *)
val remove_unix_fd:
t structure ptr -> unit ptr -> unit
(* Not implemented g_source_set_callback argument types not handled . *)
(* Not implemented g_source_set_callback_indirect argument types not handled . *)
val set_can_recurse:
t structure ptr -> bool -> unit
(* Not implemented g_source_set_funcs argument types not handled . *)
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
(* Not implemented g_source_remove_by_funcs_user_data argument types not handled . *)
val remove_by_user_data:
t structure ptr -> unit ptr -> bool
val set_name_by_id:
t structure ptr -> Unsigned.uint32 -> string -> unit

