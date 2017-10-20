open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Sequence"
let append =
foreign "g_sequence_append" (ptr t_typ @-> ptr_opt void @-> returning (ptr Sequence_iter.t_typ))

let free =
foreign "g_sequence_free" (ptr t_typ @-> returning (void))

let get_begin_iter =
foreign "g_sequence_get_begin_iter" (ptr t_typ @-> returning (ptr Sequence_iter.t_typ))

let get_end_iter =
foreign "g_sequence_get_end_iter" (ptr t_typ @-> returning (ptr Sequence_iter.t_typ))

let get_iter_at_pos =
foreign "g_sequence_get_iter_at_pos" (ptr t_typ @-> int32_t @-> returning (ptr Sequence_iter.t_typ))

let get_length =
foreign "g_sequence_get_length" (ptr t_typ @-> returning (int32_t))

let is_empty =
foreign "g_sequence_is_empty" (ptr t_typ @-> returning (bool))

let prepend =
foreign "g_sequence_prepend" (ptr t_typ @-> ptr_opt void @-> returning (ptr Sequence_iter.t_typ))

let get =
foreign "g_sequence_get" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> returning (ptr_opt void))

let insert_before =
foreign "g_sequence_insert_before" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr_opt void @-> returning (ptr Sequence_iter.t_typ))

let move =
foreign "g_sequence_move" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))

let move_range =
foreign "g_sequence_move_range" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))

let range_get_midpoint =
foreign "g_sequence_range_get_midpoint" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> returning (ptr Sequence_iter.t_typ))

let remove =
foreign "g_sequence_remove" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))

let remove_range =
foreign "g_sequence_remove_range" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))

let set =
foreign "g_sequence_set" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr_opt void @-> returning (void))

let swap =
foreign "g_sequence_swap" (ptr t_typ @-> ptr Sequence_iter.t_typ @-> ptr Sequence_iter.t_typ @-> returning (void))


