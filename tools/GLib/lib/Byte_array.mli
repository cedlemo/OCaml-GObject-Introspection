open Ctypes

type t
val t_typ : t structure typ
val f_data: (Unsigned.uint8 ptr, t structure) field
val f_len: (Unsigned.uint32, t structure) field
val free:
t structure ptr -> t structure ptr -> bool -> Unsigned.uint8 ptr

val free_to_bytes:
t structure ptr -> t structure ptr -> (* interface *) Bytes.t structure ptr

val _new:
t structure ptr -> t structure ptr

(*Not implemented g_byte_array_new_take argument types not handled*)
val unref:
t structure ptr -> t structure ptr -> unit


