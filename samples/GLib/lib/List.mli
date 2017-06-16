open Ctypes
type t
val t_typ : t structure typ
val f_data: (unit ptr, t structure) field
val f_next: (List.t structure ptr, t structure) field
val f_prev: (List.t structure ptr, t structure) field
