open Ctypes
type t
val queue : t structure typ
val head: (List.t structure ptr, t structure) field
val tail: (List.t structure ptr, t structure) field
val length: (Unsigned.uint32, t structure) field
