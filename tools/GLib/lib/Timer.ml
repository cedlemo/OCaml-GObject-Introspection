open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Timer"
let continue =
  foreign "g_timer_continue" (ptr t_typ @-> returning (void))

let destroy =
  foreign "g_timer_destroy" (ptr t_typ @-> returning (void))

let elapsed =
  foreign "g_timer_elapsed" (ptr t_typ @-> ptr uint64_t @-> returning (double))

let reset =
  foreign "g_timer_reset" (ptr t_typ @-> returning (void))

let start =
  foreign "g_timer_start" (ptr t_typ @-> returning (void))

let stop =
  foreign "g_timer_stop" (ptr t_typ @-> returning (void))


