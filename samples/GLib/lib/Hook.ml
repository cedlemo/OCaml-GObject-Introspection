open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Hook"
let f_data = field t_typ "data" (ptr void)
let f_next = field t_typ "next" (ptr t_typ)
let f_prev = field t_typ "prev" (ptr t_typ)
let f_ref_count = field t_typ "ref_count" (uint32_t)
let f_hook_id = field t_typ "hook_id" (uint64_t)
let f_flags = field t_typ "flags" (uint32_t)
let f_func = field t_typ "func" (ptr void)
(* TODO Struct field Hook : callback tag not implemented . *)
let compare_ids =
foreign "g_hook_compare_ids" (ptr t_typ @-> ptr t_typ @-> returning (int32_t))
let destroy =
foreign "g_hook_destroy" (ptr t_typ @-> ptr Hook_list.t_typ @-> uint64_t @-> returning (bool))
let destroy_link =
foreign "g_hook_destroy_link" (ptr t_typ @-> ptr Hook_list.t_typ @-> ptr t_typ @-> returning (void))
let free =
foreign "g_hook_free" (ptr t_typ @-> ptr Hook_list.t_typ @-> ptr t_typ @-> returning (void))
let insert_before =
foreign "g_hook_insert_before" (ptr t_typ @-> ptr Hook_list.t_typ @-> ptr_opt Hook.t_typ @-> ptr t_typ @-> returning (void))
let prepend =
foreign "g_hook_prepend" (ptr t_typ @-> ptr Hook_list.t_typ @-> ptr t_typ @-> returning (void))
let unref =
foreign "g_hook_unref" (ptr t_typ @-> ptr Hook_list.t_typ @-> ptr t_typ @-> returning (void))

