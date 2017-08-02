open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Source"
let f_callback_data = field t_typ "callback_data" (ptr void)
(* TODO Struct field Source : interface tag not implemented . *)
(* TODO Struct field Source : interface tag not implemented . *)
let f_ref_count = field t_typ "ref_count" (uint32_t)
(* TODO Struct field Source : interface tag not implemented . *)
let f_priority = field t_typ "priority" (int32_t)
let f_flags = field t_typ "flags" (uint32_t)
let f_source_id = field t_typ "source_id" (uint32_t)
let f_poll_fds = field t_typ "poll_fds" (ptr SList.t_typ)
(* TODO Struct field Source : interface tag not implemented . *)
(* TODO Struct field Source : interface tag not implemented . *)
let f_name = field t_typ "name" (string)
(* TODO Struct field Source : interface tag not implemented . *)
(* Not implemented g_source_new argument types not handled . *)
(* Not implemented g_source_add_child_source argument types not handled . *)
(* Not implemented g_source_add_poll argument types not handled . *)
(* Not implemented g_source_add_unix_fd argument types not handled . *)
(* Not implemented g_source_attach argument types not handled . *)
let destroy =
foreign "g_source_destroy" (ptr t_typ @-> returning (void))
let get_can_recurse =
foreign "g_source_get_can_recurse" (ptr t_typ @-> returning (bool))
(* Not implemented g_source_get_context return type not handled . *)
(* Not implemented g_source_get_current_time argument types not handled . *)
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
(* Not implemented g_source_modify_unix_fd argument types not handled . *)
(* Not implemented g_source_query_unix_fd return type not handled . *)
(* Not implemented g_source_ref return type not handled . *)
(* Not implemented g_source_remove_child_source argument types not handled . *)
(* Not implemented g_source_remove_poll argument types not handled . *)
let remove_unix_fd =
foreign "g_source_remove_unix_fd" (ptr t_typ @-> ptr void @-> returning (void))
(* Not implemented g_source_set_callback argument types not handled . *)
(* Not implemented g_source_set_callback_indirect argument types not handled . *)
let set_can_recurse =
foreign "g_source_set_can_recurse" (ptr t_typ @-> bool @-> returning (void))
(* Not implemented g_source_set_funcs argument types not handled . *)
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
(* Not implemented g_source_remove_by_funcs_user_data argument types not handled . *)
let remove_by_user_data =
foreign "g_source_remove_by_user_data" (ptr t_typ @-> ptr void @-> returning (bool))
let set_name_by_id =
foreign "g_source_set_name_by_id" (ptr t_typ @-> uint32_t @-> string @-> returning (void))

