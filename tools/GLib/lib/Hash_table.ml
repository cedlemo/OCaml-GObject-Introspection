open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Hash_table"

let add =
  foreign "g_hash_table_add" (ptr t_typ @-> ptr_opt void @-> returning (bool))
let contains =
  foreign "g_hash_table_contains" (ptr t_typ @-> ptr_opt void @-> returning (bool))
let destroy =
  foreign "g_hash_table_destroy" (ptr t_typ @-> returning (void))
let insert =
  foreign "g_hash_table_insert" (ptr t_typ @-> ptr_opt void @-> ptr_opt void @-> returning (bool))
let lookup =
  foreign "g_hash_table_lookup" (ptr t_typ @-> ptr_opt void @-> returning (ptr_opt void))
(* Not implemented g_hash_table_lookup_extended - out argument not handled
(ptr t_typ @-> ptr_opt void @-> returning (bool * ptr_opt void * ptr_opt void))
*)
let remove =
  foreign "g_hash_table_remove" (ptr t_typ @-> ptr_opt void @-> returning (bool))
let remove_all =
  foreign "g_hash_table_remove_all" (ptr t_typ @-> returning (void))
let replace =
  foreign "g_hash_table_replace" (ptr t_typ @-> ptr_opt void @-> ptr_opt void @-> returning (bool))
let size =
  foreign "g_hash_table_size" (ptr t_typ @-> returning (uint32_t))
let steal =
  foreign "g_hash_table_steal" (ptr t_typ @-> ptr_opt void @-> returning (bool))
let steal_all =
  foreign "g_hash_table_steal_all" (ptr t_typ @-> returning (void))
let unref =
  foreign "g_hash_table_unref" (ptr t_typ @-> returning (void))
