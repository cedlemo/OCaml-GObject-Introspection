open Ctypes

type t
val t_typ : t structure typ
val f_dummy1: (unit ptr, t structure) field
val f_dummy2: (unit ptr, t structure) field
val f_dummy3: (unit ptr, t structure) field
val f_dummy4: (int32, t structure) field
val f_dummy5: (bool, t structure) field
val f_dummy6: (unit ptr, t structure) field

