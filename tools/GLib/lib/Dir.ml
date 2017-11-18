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

let make_tmp arg1 =
let make_tmp_raw =
  foreign "g_dir_make_tmp" (string_opt @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = make_tmp_raw arg1 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise (function
| Some e -> Error.free e
| None -> () ) err_ptr
in
Error (err_ptr)


