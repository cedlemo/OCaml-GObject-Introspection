open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "RWLock"
let f_p = field t_typ "p" (ptr void)
(*TODO Struct field RWLock : C Array type for Types.Array tag tag not implemented*)
let clear =
foreign "g_rw_lock_clear" (ptr t_typ @-> returning (void))

let init =
foreign "g_rw_lock_init" (ptr t_typ @-> returning (void))

let reader_lock =
foreign "g_rw_lock_reader_lock" (ptr t_typ @-> returning (void))

let reader_trylock =
foreign "g_rw_lock_reader_trylock" (ptr t_typ @-> returning (bool))

let reader_unlock =
foreign "g_rw_lock_reader_unlock" (ptr t_typ @-> returning (void))

let writer_lock =
foreign "g_rw_lock_writer_lock" (ptr t_typ @-> returning (void))

let writer_trylock =
foreign "g_rw_lock_writer_trylock" (ptr t_typ @-> returning (bool))

let writer_unlock =
foreign "g_rw_lock_writer_unlock" (ptr t_typ @-> returning (void))


