open Ctypes

type t
val t_typ : t union typ
val f_p: (unit ptr, t union) field
val f_i: (Array.t structure, t union) field

