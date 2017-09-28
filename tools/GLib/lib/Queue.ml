open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Queue"
let f_head = field t_typ "head" (ptr List.t_typ)
let f_tail = field t_typ "tail" (ptr List.t_typ)
let f_length = field t_typ "length" (uint32_t)
let clear =
foreign "g_queue_clear" (ptr t_typ @-> returning (void))

let free =
foreign "g_queue_free" (ptr t_typ @-> returning (void))

(*Not implemented g_queue_free_full argument types not handled*)
let get_length =
foreign "g_queue_get_length" (ptr t_typ @-> returning (uint32_t))

let index =
foreign "g_queue_index" (ptr t_typ @-> ptr_opt void @-> returning (int32_t))

let init =
foreign "g_queue_init" (ptr t_typ @-> returning (void))

let is_empty =
foreign "g_queue_is_empty" (ptr t_typ @-> returning (bool))

let peek_head =
foreign "g_queue_peek_head" (ptr t_typ @-> returning (ptr_opt void))

let peek_nth =
foreign "g_queue_peek_nth" (ptr t_typ @-> uint32_t @-> returning (ptr_opt void))

let peek_tail =
foreign "g_queue_peek_tail" (ptr t_typ @-> returning (ptr_opt void))

let pop_head =
foreign "g_queue_pop_head" (ptr t_typ @-> returning (ptr_opt void))

let pop_nth =
foreign "g_queue_pop_nth" (ptr t_typ @-> uint32_t @-> returning (ptr_opt void))

let pop_tail =
foreign "g_queue_pop_tail" (ptr t_typ @-> returning (ptr_opt void))

let push_head =
foreign "g_queue_push_head" (ptr t_typ @-> ptr_opt void @-> returning (void))

let push_nth =
foreign "g_queue_push_nth" (ptr t_typ @-> ptr_opt void @-> int32_t @-> returning (void))

let push_tail =
foreign "g_queue_push_tail" (ptr t_typ @-> ptr_opt void @-> returning (void))

let remove =
foreign "g_queue_remove" (ptr t_typ @-> ptr_opt void @-> returning (bool))

let remove_all =
foreign "g_queue_remove_all" (ptr t_typ @-> ptr_opt void @-> returning (uint32_t))

let reverse =
foreign "g_queue_reverse" (ptr t_typ @-> returning (void))


