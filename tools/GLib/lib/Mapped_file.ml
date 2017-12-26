open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Mapped_file"

let create filename writable =
  let create_raw =
    foreign "g_mapped_file_new" (string @-> bool@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr t_typ))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = create_raw filename writable (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let new_from_fd fd writable =
  let new_from_fd_raw =
    foreign "g_mapped_file_new_from_fd" (int32_t @-> bool@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr t_typ))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = new_from_fd_raw fd writable (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
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
