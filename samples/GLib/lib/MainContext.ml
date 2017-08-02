open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "MainContext"
(* Not implemented g_main_context_new return type not handled . *)
let acquire =
foreign "g_main_context_acquire" (ptr t_typ @-> returning (bool))
(* Not implemented g_main_context_add_poll argument types not handled . *)
(* Not implemented g_main_context_check argument types not handled . *)
let dispatch =
foreign "g_main_context_dispatch" (ptr t_typ @-> returning (void))
(* Not implemented g_main_context_find_source_by_funcs_user_data argument types not handled . *)
(* Not implemented g_main_context_find_source_by_id return type not handled . *)
(* Not implemented g_main_context_find_source_by_user_data return type not handled . *)
(* Not implemented g_main_context_invoke_full argument types not handled . *)
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
(* Not implemented g_main_context_query argument types not handled . *)
(* Not implemented g_main_context_ref return type not handled . *)
let release =
foreign "g_main_context_release" (ptr t_typ @-> returning (void))
(* Not implemented g_main_context_remove_poll argument types not handled . *)
let unref =
foreign "g_main_context_unref" (ptr t_typ @-> returning (void))
(* Not implemented g_main_context_wait argument types not handled . *)
let wakeup =
foreign "g_main_context_wakeup" (ptr t_typ @-> returning (void))
(* Not implemented g_main_context_default return type not handled . *)
(* Not implemented g_main_context_get_thread_default return type not handled . *)
(* Not implemented g_main_context_ref_thread_default return type not handled . *)

