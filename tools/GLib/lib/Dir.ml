open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Dir"
let close =
foreign "g_dir_close" (ptr t_typ @-> returning (void))

let read_name =
foreign "g_dir_read_name" (ptr t_typ @-> returning (string))

let rewind =
foreign "g_dir_rewind" (ptr t_typ @-> returning (void))

let make_tmp =
foreign "g_dir_make_tmp" (ptr t_typ @-> string_opt  @-> ptr_opt (ptr Error.t_typ) @-> returning (string))


