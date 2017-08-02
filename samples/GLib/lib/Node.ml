open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Node"
let f_data = field t_typ "data" (ptr void)
(* TODO Struct field Node : interface tag not implemented . *)
(* TODO Struct field Node : interface tag not implemented . *)
(* TODO Struct field Node : interface tag not implemented . *)
(* TODO Struct field Node : interface tag not implemented . *)
let child_index =
foreign "g_node_child_index" (ptr t_typ @-> ptr void @-> returning (int32_t))
(* Not implemented g_node_child_position argument types not handled . *)
let depth =
foreign "g_node_depth" (ptr t_typ @-> returning (uint32_t))
let destroy =
foreign "g_node_destroy" (ptr t_typ @-> returning (void))
(* Not implemented g_node_is_ancestor argument types not handled . *)
let max_height =
foreign "g_node_max_height" (ptr t_typ @-> returning (uint32_t))
let n_children =
foreign "g_node_n_children" (ptr t_typ @-> returning (uint32_t))
(* Not implemented g_node_n_nodes argument types not handled . *)
let reverse_children =
foreign "g_node_reverse_children" (ptr t_typ @-> returning (void))
let unlink =
foreign "g_node_unlink" (ptr t_typ @-> returning (void))

