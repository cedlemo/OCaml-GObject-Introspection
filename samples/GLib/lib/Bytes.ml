open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Bytes"
(* Not implemented g_bytes_new argument types not handled . *)
(* Not implemented g_bytes_new_take argument types not handled . *)
let compare =
foreign "g_bytes_compare" (ptr t_typ @-> ptr t_typ @-> returning (int32_t))
let equal =
foreign "g_bytes_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))
(* Not implemented g_bytes_get_data argument types not handled . *)
let get_size =
foreign "g_bytes_get_size" (ptr t_typ @-> returning (uint64_t))
let hash =
foreign "g_bytes_hash" (ptr t_typ @-> returning (uint32_t))
let new_from_bytes =
foreign "g_bytes_new_from_bytes" (ptr t_typ @-> uint64_t @-> uint64_t @-> returning (ptr t_typ))
let ref =
foreign "g_bytes_ref" (ptr t_typ @-> returning (ptr t_typ))
let unref =
foreign "g_bytes_unref" (ptr t_typ @-> returning (void))
let unref_to_array =
foreign "g_bytes_unref_to_array" (ptr t_typ @-> returning (ptr Byte_array.t_typ))
(* Not implemented g_bytes_unref_to_data argument types not handled . *)

