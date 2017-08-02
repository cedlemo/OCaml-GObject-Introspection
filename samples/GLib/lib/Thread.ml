open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Thread"
let join =
foreign "g_thread_join" (ptr t_typ @-> returning (ptr void))
(* Not implemented g_thread_ref return type not handled . *)
let unref =
foreign "g_thread_unref" (ptr t_typ @-> returning (void))
let error_quark =
foreign "g_thread_error_quark" (ptr t_typ @-> returning (uint32_t))
let exit =
foreign "g_thread_exit" (ptr t_typ @-> ptr void @-> returning (void))
(* Not implemented g_thread_self return type not handled . *)
let yield =
foreign "g_thread_yield" (ptr t_typ @-> returning (void))

