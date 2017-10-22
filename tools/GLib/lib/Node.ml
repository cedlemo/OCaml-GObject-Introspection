open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Node"
let f_data = field t_typ "data" (ptr void)
let f_next = field t_typ "next" (ptr t_typ)
let f_prev = field t_typ "prev" (ptr t_typ)
let f_parent = field t_typ "parent" (ptr t_typ)
let f_children = field t_typ "children" (ptr t_typ)
let child_index =
  foreign "g_node_child_index" (ptr t_typ @-> ptr_opt void @-> returning (int32_t))

let child_position =
  foreign "g_node_child_position" (ptr t_typ @-> ptr t_typ @-> returning (int32_t))

let depth =
  foreign "g_node_depth" (ptr t_typ @-> returning (uint32_t))

let destroy =
  foreign "g_node_destroy" (ptr t_typ @-> returning (void))

let is_ancestor =
  foreign "g_node_is_ancestor" (ptr t_typ @-> ptr t_typ @-> returning (bool))

let max_height =
  foreign "g_node_max_height" (ptr t_typ @-> returning (uint32_t))

let n_children =
  foreign "g_node_n_children" (ptr t_typ @-> returning (uint32_t))

let n_nodes =
  foreign "g_node_n_nodes" (ptr t_typ @-> Traverse_flags.t_list_view @-> returning (uint32_t))

let reverse_children =
  foreign "g_node_reverse_children" (ptr t_typ @-> returning (void))

let unlink =
  foreign "g_node_unlink" (ptr t_typ @-> returning (void))


