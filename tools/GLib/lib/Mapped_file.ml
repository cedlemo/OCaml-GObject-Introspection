open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Mapped_file"
let _new arg1 arg2 arg3 =
let _new_raw =
  foreign "g_mapped_file_new" (ptr t_typ @-> string @-> bool @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr t_typ))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = _new_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> Error (!@ err_ptr_ptr)

let new_from_fd arg1 arg2 arg3 =
let new_from_fd_raw =
  foreign "g_mapped_file_new_from_fd" (ptr t_typ @-> int32_t @-> bool @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr t_typ))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = new_from_fd_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> Error (!@ err_ptr_ptr)

let free =
  foreign "g_mapped_file_free" (ptr t_typ @-> returning (void))

(*SKIPPED : g_mapped_file_get_bytes return type Bytes.t structure ptr*)
let get_contents =
  foreign "g_mapped_file_get_contents" (ptr t_typ @-> returning (string))

let get_length =
  foreign "g_mapped_file_get_length" (ptr t_typ @-> returning (uint64_t))

let ref =
  foreign "g_mapped_file_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_mapped_file_unref" (ptr t_typ @-> returning (void))


