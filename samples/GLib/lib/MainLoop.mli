open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_main_loop_new argument types not handled . *)
(* Not implemented g_main_loop_get_context return type not handled . *)
val is_running:
t structure ptr -> bool
val quit:
t structure ptr -> unit
(* Not implemented g_main_loop_ref return type not handled . *)
val run:
t structure ptr -> unit
val unref:
t structure ptr -> unit

