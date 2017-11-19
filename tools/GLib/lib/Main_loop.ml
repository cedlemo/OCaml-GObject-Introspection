open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Main_loop"

(*SKIPPED : g_main_loop_new argument type Main_context.t structure ptr option*)
(*SKIPPED : g_main_loop_get_context return type Main_context.t structure ptr*)
let is_running =
  foreign "g_main_loop_is_running" (ptr t_typ @-> returning (bool))

let quit =
  foreign "g_main_loop_quit" (ptr t_typ @-> returning (void))

let ref =
  foreign "g_main_loop_ref" (ptr t_typ @-> returning (ptr t_typ))

let run =
  foreign "g_main_loop_run" (ptr t_typ @-> returning (void))

let unref =
  foreign "g_main_loop_unref" (ptr t_typ @-> returning (void))

