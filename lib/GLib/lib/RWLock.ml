open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "RWLock"
let f_p = field t_typ "p" (ptr void)
(* TODO Struct field RWLock : C Array type for GITypes.Array tag tag not implemented *)
