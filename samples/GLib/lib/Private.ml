open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Private"
let f_p = field t_typ "p" (ptr void)
(* TODO Struct field Private : interface tag not implemented . *)
(* TODO Struct field Private : C Array type for GITypes.Array tag tag not implemented . *)
let get =
foreign "g_private_get" (ptr t_typ @-> returning (ptr void))
let replace =
foreign "g_private_replace" (ptr t_typ @-> ptr void @-> returning (void))
let set =
foreign "g_private_set" (ptr t_typ @-> ptr void @-> returning (void))

