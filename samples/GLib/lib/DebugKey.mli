open Ctypes
type t
val debugkey : t structure typ
val key: (string ptr, t structure) field
val value: (Unsigned.uint32, t structure) field
