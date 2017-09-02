open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Tree"
let destroy =
foreign "g_tree_destroy" (ptr t_typ @-> returning (void))
let height =
foreign "g_tree_height" (ptr t_typ @-> returning (int32_t))
let insert =
foreign "g_tree_insert" (ptr t_typ @-> ptr_opt void @-> ptr_opt void @-> returning (void))
let lookup =
foreign "g_tree_lookup" (ptr t_typ @-> ptr_opt void @-> returning (ptr_opt void))
let lookup_extended =
foreign "g_tree_lookup_extended" (ptr t_typ @-> ptr_opt void @-> ptr_opt void @-> ptr_opt void @-> returning (bool))
let nnodes =
foreign "g_tree_nnodes" (ptr t_typ @-> returning (int32_t))
let remove =
foreign "g_tree_remove" (ptr t_typ @-> ptr_opt void @-> returning (bool))
let replace =
foreign "g_tree_replace" (ptr t_typ @-> ptr_opt void @-> ptr_opt void @-> returning (void))
let steal =
foreign "g_tree_steal" (ptr t_typ @-> ptr_opt void @-> returning (bool))
let unref =
foreign "g_tree_unref" (ptr t_typ @-> returning (void))

