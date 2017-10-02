open Ctypes

type t
val t_typ : t structure typ
val get_digest:
t structure ptr -> Unsigned.uint8 ptr -> Unsigned.uint64 ptr -> unit

val get_string:
t structure ptr -> string

val unref:
t structure ptr -> unit

(*Not implemented g_hmac_update argument typeC Array type for Types.Array tag not handled*)

