open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Rand"

let _double =
  foreign "g_rand_double" (ptr t_typ @-> returning (double))
let double_range =
  foreign "g_rand_double_range" (ptr t_typ @-> double @-> double @-> returning (double))
let free =
  foreign "g_rand_free" (ptr t_typ @-> returning (void))
let _int =
  foreign "g_rand_int" (ptr t_typ @-> returning (uint32_t))
let int_range =
  foreign "g_rand_int_range" (ptr t_typ @-> int32_t @-> int32_t @-> returning (int32_t))
let set_seed =
  foreign "g_rand_set_seed" (ptr t_typ @-> uint32_t @-> returning (void))
let set_seed_array =
  foreign "g_rand_set_seed_array" (ptr t_typ @-> ptr uint32_t @-> uint32_t @-> returning (void))
