open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Thread"
let join =
foreign "g_thread_join" (ptr t_typ @-> returning (ptr_opt void))

let ref =
foreign "g_thread_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
foreign "g_thread_unref" (ptr t_typ @-> returning (void))

let error_quark =
foreign "g_thread_error_quark" (ptr t_typ @-> returning (uint32_t))

let exit =
foreign "g_thread_exit" (ptr t_typ @-> ptr_opt void @-> returning (void))

let self =
foreign "g_thread_self" (ptr t_typ @-> returning (ptr t_typ))

let yield =
foreign "g_thread_yield" (ptr t_typ @-> returning (void))


