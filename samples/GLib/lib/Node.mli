open Ctypes
type t
val node : t structure typ
val data: (unit ptr, t structure) field
val next: ( ptr, t structure) field
val prev: ( ptr, t structure) field
val parent: ( ptr, t structure) field
val children: ( ptr, t structure) field
