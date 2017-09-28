open Ctypes

type t
val t_typ : t structure typ
val g_iconv:
t structure ptr -> string -> Unsigned.uint64 ptr -> string -> Unsigned.uint64 ptr -> Unsigned.uint64

val close:
t structure ptr -> int32


