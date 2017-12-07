open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Srv_target"

let create =
  foreign "g_srv_target_new" (string @-> uint16_t @-> uint16_t @-> uint16_t @-> returning (ptr t_typ))

let copy =
  foreign "g_srv_target_copy" (ptr t_typ @-> returning (ptr t_typ))

let free =
  foreign "g_srv_target_free" (ptr t_typ @-> returning (void))

let get_hostname =
  foreign "g_srv_target_get_hostname" (ptr t_typ @-> returning (string))

let get_port =
  foreign "g_srv_target_get_port" (ptr t_typ @-> returning (uint16_t))

let get_priority =
  foreign "g_srv_target_get_priority" (ptr t_typ @-> returning (uint16_t))

let get_weight =
  foreign "g_srv_target_get_weight" (ptr t_typ @-> returning (uint16_t))

