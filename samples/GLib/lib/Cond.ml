open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Cond"
let f_p = field t_typ "p" (ptr void)
(* TODO Struct field Cond : C Array type for GITypes.Array tag tag not implemented . *)

