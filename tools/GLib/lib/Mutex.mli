open Ctypes

type t
val t_typ : t union typ
val f_p: (unit ptr, t union) field
(*TODO Union field Mutex : C Array type for Types.Array tag tag not implemented*)

