open Ctypes
type t
val list : t structure typ
val data: (unit ptr, t structure) field
val next: (List.t structure ptr, t structure) field
val prev: (List.t structure ptr, t structure) field
