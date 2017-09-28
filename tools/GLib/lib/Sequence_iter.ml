open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Sequence_iter"
let compare =
foreign "g_sequence_iter_compare" (ptr t_typ @-> ptr t_typ @-> returning (int32_t))

let get_position =
foreign "g_sequence_iter_get_position" (ptr t_typ @-> returning (int32_t))

let is_begin =
foreign "g_sequence_iter_is_begin" (ptr t_typ @-> returning (bool))

let is_end =
foreign "g_sequence_iter_is_end" (ptr t_typ @-> returning (bool))


