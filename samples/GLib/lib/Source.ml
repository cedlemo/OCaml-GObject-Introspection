open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "Source"
let f_callback_data = field t_typ "callback_data" (ptr void)
let f_callback_funcs = field t_typ "callback_funcs" (ptr )
let f_source_funcs = field t_typ "source_funcs" (ptr )
let f_ref_count = field t_typ "ref_count" (uint32_t)
let f_context = field t_typ "context" (ptr )
let f_priority = field t_typ "priority" (int32_t)
let f_flags = field t_typ "flags" (uint32_t)
let f_source_id = field t_typ "source_id" (uint32_t)
let f_poll_fds = field t_typ "poll_fds" (ptr SList.t_typ)
let f_prev = field t_typ "prev" (ptr )
let f_next = field t_typ "next" (ptr )
let f_name = field t_typ "name" (ptr string)
let f_priv = field t_typ "priv" (ptr )
