open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Source"
let f_callback_data = field t_typ "callback_data" (ptr void)
let f_callback_funcs = field t_typ "callback_funcs" (ptr Source_callback_funcs.t_typ)
let f_source_funcs = field t_typ "source_funcs" (ptr Source_funcs.t_typ)
let f_ref_count = field t_typ "ref_count" (uint32_t)
let f_context = field t_typ "context" (ptr Main_context.t_typ)
let f_priority = field t_typ "priority" (int32_t)
let f_flags = field t_typ "flags" (uint32_t)
let f_source_id = field t_typ "source_id" (uint32_t)
let f_poll_fds = field t_typ "poll_fds" (ptr SList.t_typ)
let f_prev = field t_typ "prev" (ptr t_typ)
let f_next = field t_typ "next" (ptr t_typ)
let f_name = field t_typ "name" (string)
let f_priv = field t_typ "priv" (ptr Source_private.t_typ)
let _new =
foreign "g_source_new" (ptr t_typ @-> ptr Source_funcs.t_typ @-> uint32_t @-> returning (ptr t_typ))
let add_child_source =
foreign "g_source_add_child_source" (ptr t_typ @-> ptr t_typ @-> returning (void))
let add_poll =
foreign "g_source_add_poll" (ptr t_typ @-> ptr Poll_fd.t_typ @-> returning (void))
let add_unix_fd =
foreign "g_source_add_unix_fd" (ptr t_typ @-> int32_t @-> Core.iocondition_list @-> returning (ptr void))
let attach =
foreign "g_source_attach" (ptr t_typ @-> ptr_opt Main_context.t_typ @-> returning (uint32_t))
let destroy =
foreign "g_source_destroy" (ptr t_typ @-> returning (void))
let get_can_recurse =
foreign "g_source_get_can_recurse" (ptr t_typ @-> returning (bool))
let get_context =
foreign "g_source_get_context" (ptr t_typ @-> returning (ptr_opt Main_context.t_typ))
let get_current_time =
foreign "g_source_get_current_time" (ptr t_typ @-> ptr Time_val.t_typ @-> returning (void))
let get_id =
foreign "g_source_get_id" (ptr t_typ @-> returning (uint32_t))
let get_name =
foreign "g_source_get_name" (ptr t_typ @-> returning (string))
let get_priority =
foreign "g_source_get_priority" (ptr t_typ @-> returning (int32_t))
let get_ready_time =
foreign "g_source_get_ready_time" (ptr t_typ @-> returning (int64_t))
let get_time =
foreign "g_source_get_time" (ptr t_typ @-> returning (int64_t))
let is_destroyed =
foreign "g_source_is_destroyed" (ptr t_typ @-> returning (bool))
let modify_unix_fd =
foreign "g_source_modify_unix_fd" (ptr t_typ @-> ptr void @-> Core.iocondition_list @-> returning (void))
let query_unix_fd =
foreign "g_source_query_unix_fd" (ptr t_typ @-> ptr void @-> returning (Core.iocondition_list))
let ref =
foreign "g_source_ref" (ptr t_typ @-> returning (ptr t_typ))
let remove_child_source =
foreign "g_source_remove_child_source" (ptr t_typ @-> ptr t_typ @-> returning (void))
let remove_poll =
foreign "g_source_remove_poll" (ptr t_typ @-> ptr Poll_fd.t_typ @-> returning (void))
let remove_unix_fd =
foreign "g_source_remove_unix_fd" (ptr t_typ @-> ptr void @-> returning (void))
(* Not implemented g_source_set_callback argument types not handled . *)
let set_callback_indirect =
foreign "g_source_set_callback_indirect" (ptr t_typ @-> ptr_opt void @-> ptr Source_callback_funcs.t_typ @-> returning (void))
let set_can_recurse =
foreign "g_source_set_can_recurse" (ptr t_typ @-> bool @-> returning (void))
let set_funcs =
foreign "g_source_set_funcs" (ptr t_typ @-> ptr Source_funcs.t_typ @-> returning (void))
let set_name =
foreign "g_source_set_name" (ptr t_typ @-> string @-> returning (void))
let set_priority =
foreign "g_source_set_priority" (ptr t_typ @-> int32_t @-> returning (void))
let set_ready_time =
foreign "g_source_set_ready_time" (ptr t_typ @-> int64_t @-> returning (void))
let unref =
foreign "g_source_unref" (ptr t_typ @-> returning (void))
let remove =
foreign "g_source_remove" (ptr t_typ @-> uint32_t @-> returning (bool))
let remove_by_funcs_user_data =
foreign "g_source_remove_by_funcs_user_data" (ptr t_typ @-> ptr Source_funcs.t_typ @-> ptr_opt void @-> returning (bool))
let remove_by_user_data =
foreign "g_source_remove_by_user_data" (ptr t_typ @-> ptr_opt void @-> returning (bool))
let set_name_by_id =
foreign "g_source_set_name_by_id" (ptr t_typ @-> uint32_t @-> string @-> returning (void))

