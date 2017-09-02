open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Thread_pool"
(* TODO Struct field Thread_pool : callback tag not implemented . *)
let f_user_data = field t_typ "user_data" (ptr void)
let f_exclusive = field t_typ "exclusive" (bool)
let free =
foreign "g_thread_pool_free" (ptr t_typ @-> bool @-> bool @-> returning (void))
let get_max_threads =
foreign "g_thread_pool_get_max_threads" (ptr t_typ @-> returning (int32_t))
let get_num_threads =
foreign "g_thread_pool_get_num_threads" (ptr t_typ @-> returning (uint32_t))
let move_to_front =
foreign "g_thread_pool_move_to_front" (ptr t_typ @-> ptr_opt void @-> returning (bool))
let push =
foreign "g_thread_pool_push" (ptr t_typ @-> ptr_opt void  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))
let set_max_threads =
foreign "g_thread_pool_set_max_threads" (ptr t_typ @-> int32_t  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))
let unprocessed =
foreign "g_thread_pool_unprocessed" (ptr t_typ @-> returning (uint32_t))
let get_max_idle_time =
foreign "g_thread_pool_get_max_idle_time" (ptr t_typ @-> returning (uint32_t))
let get_max_unused_threads =
foreign "g_thread_pool_get_max_unused_threads" (ptr t_typ @-> returning (int32_t))
let get_num_unused_threads =
foreign "g_thread_pool_get_num_unused_threads" (ptr t_typ @-> returning (uint32_t))
let set_max_idle_time =
foreign "g_thread_pool_set_max_idle_time" (ptr t_typ @-> uint32_t @-> returning (void))
let set_max_unused_threads =
foreign "g_thread_pool_set_max_unused_threads" (ptr t_typ @-> int32_t @-> returning (void))
let stop_unused_threads =
foreign "g_thread_pool_stop_unused_threads" (ptr t_typ @-> returning (void))

