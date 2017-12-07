open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Static_resource"

let f_data = field t_typ "data" (ptr uint8_t)
let f_data_len = field t_typ "data_len" (uint64_t)
let f_resource = field t_typ "resource" (ptr Resource.t_typ)
let f_next = field t_typ "next" (ptr t_typ)
let f_padding = field t_typ "padding" (ptr void)
let _ = seal t_typ

let fini =
  foreign "g_static_resource_fini" (ptr t_typ @-> returning (void))

let get_resource =
  foreign "g_static_resource_get_resource" (ptr t_typ @-> returning (ptr Resource.t_typ))

let init =
  foreign "g_static_resource_init" (ptr t_typ @-> returning (void))

