open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Cond"
let f_p = field t_typ "p" (ptr void)
(*Struct field Cond : C Array type for Types.Array tag tag not implemented*)
let broadcast =
foreign "g_cond_broadcast" (ptr t_typ @-> returning (void))

let clear =
foreign "g_cond_clear" (ptr t_typ @-> returning (void))

let init =
foreign "g_cond_init" (ptr t_typ @-> returning (void))

let signal =
foreign "g_cond_signal" (ptr t_typ @-> returning (void))

(*Not implemented g_cond_wait argument typeunion not handled*)
(*Not implemented g_cond_wait_until argument typeunion not handled*)

