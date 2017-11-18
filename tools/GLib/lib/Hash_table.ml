open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Hash_table"
let add =
  foreign "g_hash_table_add" (void @-> ptr t_typ @-> ptr_opt void @-> returning (bool))

let contains =
  foreign "g_hash_table_contains" (void @-> ptr t_typ @-> ptr_opt void @-> returning (bool))

let destroy =
  foreign "g_hash_table_destroy" (void @-> ptr t_typ @-> returning (void))

let insert =
  foreign "g_hash_table_insert" (void @-> ptr t_typ @-> ptr_opt void @-> ptr_opt void @-> returning (bool))

let lookup =
  foreign "g_hash_table_lookup" (void @-> ptr t_typ @-> ptr_opt void @-> returning (ptr_opt void))

(*Not implemented g_hash_table_lookup_extended argument typeArg_info.InOut or Arg_info.Out not handled*)
let remove =
  foreign "g_hash_table_remove" (void @-> ptr t_typ @-> ptr_opt void @-> returning (bool))

let remove_all =
  foreign "g_hash_table_remove_all" (void @-> ptr t_typ @-> returning (void))

let replace =
  foreign "g_hash_table_replace" (void @-> ptr t_typ @-> ptr_opt void @-> ptr_opt void @-> returning (bool))

let size =
  foreign "g_hash_table_size" (void @-> ptr t_typ @-> returning (uint32_t))

let steal =
  foreign "g_hash_table_steal" (void @-> ptr t_typ @-> ptr_opt void @-> returning (bool))

let steal_all =
  foreign "g_hash_table_steal_all" (void @-> ptr t_typ @-> returning (void))

let unref =
  foreign "g_hash_table_unref" (void @-> ptr t_typ @-> returning (void))


