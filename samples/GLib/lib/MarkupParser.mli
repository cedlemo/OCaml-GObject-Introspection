open Ctypes
type t
val markupparser : t structure typ
val start_element: (, t structure) field
val end_element: (, t structure) field
val text: (, t structure) field
val passthrough: (, t structure) field
val error: (, t structure) field
