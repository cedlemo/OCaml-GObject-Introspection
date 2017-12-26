open Ctypes

type t
val t_typ : t structure typ

(*SKIPPED :  g_main_loop_new type Main_context.t structure ptr option skipped*)
(*SKIPPED : g_main_loop_get_context return type Main_context.t structure ptr*)
val is_running:
  t structure ptr -> bool
val quit:
  t structure ptr -> unit
val ref:
  t structure ptr -> t structure ptr
val run:
  t structure ptr -> unit
val unref:
  t structure ptr -> unit
