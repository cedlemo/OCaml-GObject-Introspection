open Ctypes
type t
val bytearray : t structure typ
val data: (Unsigned.uint8 ptr, t structure) field
val len: (Unsigned.uint32, t structure) field
