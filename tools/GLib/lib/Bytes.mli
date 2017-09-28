open Ctypes

type t
val t_typ : t structure typ
(*Not implemented g_bytes_new argument types not handled*)
(*Not implemented g_bytes_new_take argument types not handled*)
val compare:
t structure ptr -> t structure ptr -> int32

val equal:
t structure ptr -> t structure ptr -> bool

(*Not implemented g_bytes_get_data argument types not handled*)
val get_size:
t structure ptr -> Unsigned.uint64

val hash:
t structure ptr -> Unsigned.uint32

val new_from_bytes:
t structure ptr -> Unsigned.uint64 -> Unsigned.uint64 -> t structure ptr

val ref:
t structure ptr -> t structure ptr

val unref:
t structure ptr -> unit

val unref_to_array:
t structure ptr -> Byte_array.t structure ptr

(*Not implemented g_bytes_unref_to_data argument types not handled*)

