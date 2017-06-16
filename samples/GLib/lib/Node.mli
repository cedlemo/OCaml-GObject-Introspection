open Ctypes
type t
val t_typ : t structure typ
val f_data: (unit ptr, t structure) field
val f_next: ( ptr, t structure) field
val f_prev: ( ptr, t structure) field
val f_parent: ( ptr, t structure) field
val f_children: ( ptr, t structure) field
