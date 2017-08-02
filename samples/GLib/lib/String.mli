open Ctypes

type t
val t_typ : t structure typ
val f_str: (string, t structure) field
val f_len: (Unsigned.uint64, t structure) field
val f_allocated_len: (Unsigned.uint64, t structure) field
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
val hash:
t structure ptr -> Unsigned.uint32
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

