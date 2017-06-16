open Ctypes
type t
val t_typ : t structure typ
val f_start_element: (, t structure) field
val f_end_element: (, t structure) field
val f_text: (, t structure) field
val f_passthrough: (, t structure) field
val f_error: (, t structure) field
