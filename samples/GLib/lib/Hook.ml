open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Hook"
let f_data = field t_typ "data" (ptr void)
(* TODO Struct field Hook : interface tag not implemented . *)
(* TODO Struct field Hook : interface tag not implemented . *)
let f_ref_count = field t_typ "ref_count" (uint32_t)
let f_hook_id = field t_typ "hook_id" (uint64_t)
let f_flags = field t_typ "flags" (uint32_t)
let f_func = field t_typ "func" (ptr void)
(* TODO Struct field Hook : interface tag not implemented . *)
(* Not implemented g_hook_compare_ids argument types not handled . *)
(* Not implemented g_hook_destroy argument types not handled . *)
(* Not implemented g_hook_destroy_link argument types not handled . *)
(* Not implemented g_hook_free argument types not handled . *)
(* Not implemented g_hook_insert_before argument types not handled . *)
(* Not implemented g_hook_prepend argument types not handled . *)
(* Not implemented g_hook_unref argument types not handled . *)

