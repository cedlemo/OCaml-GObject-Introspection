open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Thread_pool"

(*Struct field Thread_pool : callback tag not implemented*)
let f_user_data = field t_typ "user_data" (ptr void)
let f_exclusive = field t_typ "exclusive" (bool)
let _ = seal t_typ

let free =
  foreign "g_thread_pool_free" (ptr t_typ @-> bool @-> bool @-> returning (void))

let get_max_threads =
  foreign "g_thread_pool_get_max_threads" (ptr t_typ @-> returning (int32_t))

let get_num_threads =
  foreign "g_thread_pool_get_num_threads" (ptr t_typ @-> returning (uint32_t))

let move_to_front =
  foreign "g_thread_pool_move_to_front" (ptr t_typ @-> ptr_opt void @-> returning (bool))

let push arg1 arg2 =
let push_raw =
  foreign "g_thread_pool_push" (ptr t_typ @-> ptr_opt void @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = push_raw arg1 arg2 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise (function
| Some e -> Error.free e
| None -> () ) err_ptr
in
Error (err_ptr)

let set_max_threads arg1 arg2 =
let set_max_threads_raw =
  foreign "g_thread_pool_set_max_threads" (ptr t_typ @-> int32_t @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = set_max_threads_raw arg1 arg2 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise (function
| Some e -> Error.free e
| None -> () ) err_ptr
in
Error (err_ptr)

let unprocessed =
  foreign "g_thread_pool_unprocessed" (ptr t_typ @-> returning (uint32_t))

let get_max_idle_time =
  foreign "g_thread_pool_get_max_idle_time" (void @-> returning (uint32_t))

let get_max_unused_threads =
  foreign "g_thread_pool_get_max_unused_threads" (void @-> returning (int32_t))

let get_num_unused_threads =
  foreign "g_thread_pool_get_num_unused_threads" (void @-> returning (uint32_t))

let set_max_idle_time =
  foreign "g_thread_pool_set_max_idle_time" (uint32_t @-> returning (void))

let set_max_unused_threads =
  foreign "g_thread_pool_set_max_unused_threads" (int32_t @-> returning (void))

let stop_unused_threads =
  foreign "g_thread_pool_stop_unused_threads" (void @-> returning (void))

