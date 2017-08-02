open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "AsyncQueue"
let length =
foreign "g_async_queue_length" (ptr t_typ @-> returning (int32_t))
let length_unlocked =
foreign "g_async_queue_length_unlocked" (ptr t_typ @-> returning (int32_t))
let lock =
foreign "g_async_queue_lock" (ptr t_typ @-> returning (void))
let pop =
foreign "g_async_queue_pop" (ptr t_typ @-> returning (ptr void))
let pop_unlocked =
foreign "g_async_queue_pop_unlocked" (ptr t_typ @-> returning (ptr void))
let push =
foreign "g_async_queue_push" (ptr t_typ @-> ptr void @-> returning (void))
let push_front =
foreign "g_async_queue_push_front" (ptr t_typ @-> ptr void @-> returning (void))
let push_front_unlocked =
foreign "g_async_queue_push_front_unlocked" (ptr t_typ @-> ptr void @-> returning (void))
let push_unlocked =
foreign "g_async_queue_push_unlocked" (ptr t_typ @-> ptr void @-> returning (void))
let ref_unlocked =
foreign "g_async_queue_ref_unlocked" (ptr t_typ @-> returning (void))
let remove =
foreign "g_async_queue_remove" (ptr t_typ @-> ptr void @-> returning (bool))
let remove_unlocked =
foreign "g_async_queue_remove_unlocked" (ptr t_typ @-> ptr void @-> returning (bool))
(* Not implemented g_async_queue_timed_pop argument types not handled . *)
(* Not implemented g_async_queue_timed_pop_unlocked argument types not handled . *)
let timeout_pop =
foreign "g_async_queue_timeout_pop" (ptr t_typ @-> uint64_t @-> returning (ptr void))
let timeout_pop_unlocked =
foreign "g_async_queue_timeout_pop_unlocked" (ptr t_typ @-> uint64_t @-> returning (ptr void))
let try_pop =
foreign "g_async_queue_try_pop" (ptr t_typ @-> returning (ptr void))
let try_pop_unlocked =
foreign "g_async_queue_try_pop_unlocked" (ptr t_typ @-> returning (ptr void))
let unlock =
foreign "g_async_queue_unlock" (ptr t_typ @-> returning (void))
let unref =
foreign "g_async_queue_unref" (ptr t_typ @-> returning (void))
let unref_and_unlock =
foreign "g_async_queue_unref_and_unlock" (ptr t_typ @-> returning (void))

