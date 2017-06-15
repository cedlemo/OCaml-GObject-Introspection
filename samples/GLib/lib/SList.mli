open Ctypes
type t
val slist : t structure typ
val data: (unit ptr, t structure) field
val next: (SList.t structure ptr, t structure) field
