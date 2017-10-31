open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Poll_fd"
let f_fd = field t_typ "fd" (int32_t)
let f_events = field t_typ "events" (uint16_t)
let f_revents = field t_typ "revents" (uint16_t)
let _ = seal t_typ

