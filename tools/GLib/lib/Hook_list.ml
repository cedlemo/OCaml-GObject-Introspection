open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Hook_list"
let f_seq_id = field t_typ "seq_id" (uint64_t)
let f_hook_size = field t_typ "hook_size" (uint32_t)
let f_is_setup = field t_typ "is_setup" (uint32_t)
let f_hooks = field t_typ "hooks" (ptr Hook.t_typ)
let f_dummy3 = field t_typ "dummy3" (ptr void)
(*TODO Struct field Hook_list : callback tag not implemented*)
(*TODO Struct field Hook_list : C Array type for Types.Array tag tag not implemented*)
let clear =
foreign "g_hook_list_clear" (ptr t_typ @-> returning (void))

let init =
foreign "g_hook_list_init" (ptr t_typ @-> uint32_t @-> returning (void))

let invoke =
foreign "g_hook_list_invoke" (ptr t_typ @-> bool @-> returning (void))

let invoke_check =
foreign "g_hook_list_invoke_check" (ptr t_typ @-> bool @-> returning (void))


