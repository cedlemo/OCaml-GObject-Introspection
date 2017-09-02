open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Sequence"
let free =
foreign "g_sequence_free" (ptr t_typ @-> returning (void))
let get_length =
foreign "g_sequence_get_length" (ptr t_typ @-> returning (int32_t))
let is_empty =
foreign "g_sequence_is_empty" (ptr t_typ @-> returning (bool))
let get =
foreign "g_sequence_get" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> returning (ptr_opt void))
let move =
foreign "g_sequence_move" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))
let move_range =
foreign "g_sequence_move_range" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))
let remove =
foreign "g_sequence_remove" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))
let remove_range =
foreign "g_sequence_remove_range" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))
let set =
foreign "g_sequence_set" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr_opt void @-> returning (void))
let swap =
foreign "g_sequence_swap" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))

