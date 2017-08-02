open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_checksum_new argument types not handled . *)
(* Not implemented g_checksum_copy return type not handled . *)
val free:
t structure ptr -> unit
val get_string:
t structure ptr -> string
val reset:
t structure ptr -> unit
(* Not implemented g_checksum_update argument types not handled . *)
(* Not implemented g_checksum_type_get_length argument types not handled . *)

