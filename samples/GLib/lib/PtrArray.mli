open Ctypes
type t
val ptrarray : t structure typ
val pdata: (unit ptr, t structure) field
val len: (Unsigned.uint32, t structure) field
