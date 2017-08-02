open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Bytes"
(* Not implemented g_bytes_new argument types not handled . *)
(* Not implemented g_bytes_new_take argument types not handled . *)
(* Not implemented g_bytes_compare argument types not handled . *)
(* Not implemented g_bytes_equal argument types not handled . *)
(* Not implemented g_bytes_get_data argument types not handled . *)
let get_size =
foreign "g_bytes_get_size" (ptr t_typ @-> returning (uint64_t))
let hash =
foreign "g_bytes_hash" (ptr t_typ @-> returning (uint32_t))
(* Not implemented g_bytes_new_from_bytes return type not handled . *)
(* Not implemented g_bytes_ref return type not handled . *)
let unref =
foreign "g_bytes_unref" (ptr t_typ @-> returning (void))
(* Not implemented g_bytes_unref_to_array return type not handled . *)
(* Not implemented g_bytes_unref_to_data argument types not handled . *)

