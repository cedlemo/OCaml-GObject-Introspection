open Ctypes
type t
val sourcefuncs : t structure typ
val prepare: (, t structure) field
val check: (, t structure) field
val dispatch: (unit ptr, t structure) field
val finalize: (, t structure) field
val closure_callback: (, t structure) field
val closure_marshal: (, t structure) field
