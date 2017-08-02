open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "RecMutex"
let f_p = field t_typ "p" (ptr void)
(* TODO Struct field RecMutex : C Array type for GITypes.Array tag tag not implemented . *)
let clear =
foreign "g_rec_mutex_clear" (ptr t_typ @-> returning (void))
let init =
foreign "g_rec_mutex_init" (ptr t_typ @-> returning (void))
let lock =
foreign "g_rec_mutex_lock" (ptr t_typ @-> returning (void))
let trylock =
foreign "g_rec_mutex_trylock" (ptr t_typ @-> returning (bool))
let unlock =
foreign "g_rec_mutex_unlock" (ptr t_typ @-> returning (void))

