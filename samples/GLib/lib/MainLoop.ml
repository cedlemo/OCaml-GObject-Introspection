open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "MainLoop"
(* Not implemented g_main_loop_new argument types not handled . *)
(* Not implemented g_main_loop_get_context return type not handled . *)
let is_running =
foreign "g_main_loop_is_running" (ptr t_typ @-> returning (bool))
let quit =
foreign "g_main_loop_quit" (ptr t_typ @-> returning (void))
(* Not implemented g_main_loop_ref return type not handled . *)
let run =
foreign "g_main_loop_run" (ptr t_typ @-> returning (void))
let unref =
foreign "g_main_loop_unref" (ptr t_typ @-> returning (void))

