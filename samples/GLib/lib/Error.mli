open Ctypes
type t
val error : t structure typ
val domain: (Unsigned.uint32, t structure) field
val code: (int32, t structure) field
val message: (string ptr, t structure) field
