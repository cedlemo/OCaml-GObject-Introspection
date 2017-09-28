open Ctypes
open Foreign

type t
let t_typ : t union typ = union "Mutex"
let f_p = field t_typ "p" (ptr void)
(*TODO Union field Mutex : C Array type for Types.Array tag tag not implemented*)

