open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Main_context"
let _new =
foreign "g_main_context_new" (ptr t_typ @-> returning (ptr t_typ))

let acquire =
foreign "g_main_context_acquire" (ptr t_typ @-> returning (bool))

let add_poll =
foreign "g_main_context_add_poll" (ptr t_typ @-> ptr Poll_fd.t_typ @-> int32_t @-> returning (void))

(*Not implemented g_main_context_check argument typeC Array type for Types.Array tag not handled*)
let dispatch =
foreign "g_main_context_dispatch" (ptr t_typ @-> returning (void))

let find_source_by_funcs_user_data =
foreign "g_main_context_find_source_by_funcs_user_data" (ptr t_typ @-> ptr Source_funcs.t_typ @-> ptr_opt void @-> returning (ptr Source.t_typ))

let find_source_by_id =
foreign "g_main_context_find_source_by_id" (ptr t_typ @-> uint32_t @-> returning (ptr Source.t_typ))

let find_source_by_user_data =
foreign "g_main_context_find_source_by_user_data" (ptr t_typ @-> ptr_opt void @-> returning (ptr Source.t_typ))

(*Not implemented g_main_context_invoke_full argument typecallback not handled*)
let is_owner =
foreign "g_main_context_is_owner" (ptr t_typ @-> returning (bool))

let iteration =
foreign "g_main_context_iteration" (ptr t_typ @-> bool @-> returning (bool))

let pending =
foreign "g_main_context_pending" (ptr t_typ @-> returning (bool))

let pop_thread_default =
foreign "g_main_context_pop_thread_default" (ptr t_typ @-> returning (void))

let prepare =
foreign "g_main_context_prepare" (ptr t_typ @-> ptr int32_t @-> returning (bool))

let push_thread_default =
foreign "g_main_context_push_thread_default" (ptr t_typ @-> returning (void))

(*Not implemented g_main_context_query argument typeArg_info.InOut or Arg_info.Out not handled*)
let ref =
foreign "g_main_context_ref" (ptr t_typ @-> returning (ptr t_typ))

let release =
foreign "g_main_context_release" (ptr t_typ @-> returning (void))

let remove_poll =
foreign "g_main_context_remove_poll" (ptr t_typ @-> ptr Poll_fd.t_typ @-> returning (void))

let unref =
foreign "g_main_context_unref" (ptr t_typ @-> returning (void))

(*Not implemented g_main_context_wait argument typeunion not handled*)
let wakeup =
foreign "g_main_context_wakeup" (ptr t_typ @-> returning (void))

let default =
foreign "g_main_context_default" (ptr t_typ @-> returning (ptr t_typ))

let get_thread_default =
foreign "g_main_context_get_thread_default" (ptr t_typ @-> returning (ptr t_typ))

let ref_thread_default =
foreign "g_main_context_ref_thread_default" (ptr t_typ @-> returning (ptr t_typ))


