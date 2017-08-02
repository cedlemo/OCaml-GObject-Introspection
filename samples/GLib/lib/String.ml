open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "String"
let f_str = field t_typ "str" (string)
let f_len = field t_typ "len" (uint64_t)
let f_allocated_len = field t_typ "allocated_len" (uint64_t)
(* Not implemented g_string_append return type not handled . *)
(* Not implemented g_string_append_c return type not handled . *)
(* Not implemented g_string_append_len return type not handled . *)
(* Not implemented g_string_append_unichar argument types not handled . *)
(* Not implemented g_string_append_uri_escaped return type not handled . *)
(* Not implemented g_string_ascii_down return type not handled . *)
(* Not implemented g_string_ascii_up return type not handled . *)
(* Not implemented g_string_assign return type not handled . *)
(* Not implemented g_string_down return type not handled . *)
(* Not implemented g_string_equal argument types not handled . *)
(* Not implemented g_string_erase return type not handled . *)
(* Not implemented g_string_free return type not handled . *)
(* Not implemented g_string_free_to_bytes return type not handled . *)
let hash =
foreign "g_string_hash" (ptr t_typ @-> returning (uint32_t))
(* Not implemented g_string_insert return type not handled . *)
(* Not implemented g_string_insert_c return type not handled . *)
(* Not implemented g_string_insert_len return type not handled . *)
(* Not implemented g_string_insert_unichar argument types not handled . *)
(* Not implemented g_string_overwrite return type not handled . *)
(* Not implemented g_string_overwrite_len return type not handled . *)
(* Not implemented g_string_prepend return type not handled . *)
(* Not implemented g_string_prepend_c return type not handled . *)
(* Not implemented g_string_prepend_len return type not handled . *)
(* Not implemented g_string_prepend_unichar argument types not handled . *)
(* Not implemented g_string_set_size return type not handled . *)
(* Not implemented g_string_truncate return type not handled . *)
(* Not implemented g_string_up return type not handled . *)

