open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "Hook"
let f_data = field t_typ "data" (ptr void)
let f_next = field t_typ "next" (ptr )
let f_prev = field t_typ "prev" (ptr )
let f_ref_count = field t_typ "ref_count" (uint32_t)
let f_hook_id = field t_typ "hook_id" (uint64_t)
let f_flags = field t_typ "flags" (uint32_t)
let f_func = field t_typ "func" (ptr void)
let f_destroy = field t_typ "destroy" ()
