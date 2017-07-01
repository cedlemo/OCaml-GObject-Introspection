open Ctypes

type t
val t_typ : t structure typ
val f_p: (unit ptr, t structure) field
val f_future: (Array.t structure, t structure) field

