open Ctypes
type t
val logfield : t structure typ
val key: (string ptr, t structure) field
val value: (unit ptr, t structure) field
val length: (int64, t structure) field
