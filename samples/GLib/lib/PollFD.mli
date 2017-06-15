open Ctypes
type t
val pollfd : t structure typ
val fd: (int32, t structure) field
val events: (Unsigned.uint16, t structure) field
val revents: (Unsigned.uint16, t structure) field
