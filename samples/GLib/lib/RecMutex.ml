open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "RecMutex"
let f_p = field t_typ "p" (ptr void)
(* TODO Struct field RecMutex : C Array type for GITypes.Array tag tag not implemented . *)

