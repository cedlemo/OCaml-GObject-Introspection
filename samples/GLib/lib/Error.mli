open Ctypes

type t
val t_typ : t structure typ
val f_domain: (Unsigned.uint32, t structure) field
val f_code: (int32, t structure) field
val f_message: (string, t structure) field
(* Not implemented g_error_new_literal return type not handled . *)
(* Not implemented g_error_copy return type not handled . *)
val free:
t structure ptr -> unit
val matches:
t structure ptr -> Unsigned.uint32 -> int32 -> bool

