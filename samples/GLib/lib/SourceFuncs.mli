open Ctypes
type t
val t_typ : t structure typ
val f_prepare: (, t structure) field
val f_check: (, t structure) field
val f_dispatch: (unit ptr, t structure) field
val f_finalize: (, t structure) field
val f_closure_callback: (, t structure) field
val f_closure_marshal: (, t structure) field
