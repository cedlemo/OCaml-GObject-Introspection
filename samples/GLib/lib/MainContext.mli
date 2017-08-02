open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_main_context_new return type not handled . *)
val acquire:
t structure ptr -> bool
(* Not implemented g_main_context_add_poll argument types not handled . *)
(* Not implemented g_main_context_check argument types not handled . *)
val dispatch:
t structure ptr -> unit
(* Not implemented g_main_context_find_source_by_funcs_user_data argument types not handled . *)
(* Not implemented g_main_context_find_source_by_id return type not handled . *)
(* Not implemented g_main_context_find_source_by_user_data return type not handled . *)
(* Not implemented g_main_context_invoke_full argument types not handled . *)
val is_owner:
t structure ptr -> bool
val iteration:
t structure ptr -> bool -> bool
val pending:
t structure ptr -> bool
val pop_thread_default:
t structure ptr -> unit
val prepare:
t structure ptr -> int32 ptr -> bool
val push_thread_default:
t structure ptr -> unit
(* Not implemented g_main_context_query argument types not handled . *)
(* Not implemented g_main_context_ref return type not handled . *)
val release:
t structure ptr -> unit
(* Not implemented g_main_context_remove_poll argument types not handled . *)
val unref:
t structure ptr -> unit
(* Not implemented g_main_context_wait argument types not handled . *)
val wakeup:
t structure ptr -> unit
(* Not implemented g_main_context_default return type not handled . *)
(* Not implemented g_main_context_get_thread_default return type not handled . *)
(* Not implemented g_main_context_ref_thread_default return type not handled . *)

