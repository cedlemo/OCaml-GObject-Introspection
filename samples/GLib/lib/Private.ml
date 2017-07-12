open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Private"
let f_p = field t_typ "p" (ptr void)
(* TODO Struct field Private : interface tag not implemented *)(* TODO Struct field Private : C Array type for GITypes.Array tag tag not implemented *)
