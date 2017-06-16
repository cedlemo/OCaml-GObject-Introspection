open Ctypes
type t
val t_typ : t structure typ
val f_data: ( ptr, t structure) field
val f_msgs: (SList.t structure ptr, t structure) field
