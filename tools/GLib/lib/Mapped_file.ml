open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Mapped_file"
let _new =
foreign "g_mapped_file_new" (ptr t_typ @-> string @-> bool  @-> ptr_opt (ptr Error.t_typ) @-> returning (ptr t_typ))

let new_from_fd =
foreign "g_mapped_file_new_from_fd" (ptr t_typ @-> int32_t @-> bool  @-> ptr_opt (ptr Error.t_typ) @-> returning (ptr t_typ))

let free =
foreign "g_mapped_file_free" (ptr t_typ @-> returning (void))

let get_bytes =
foreign "g_mapped_file_get_bytes" (ptr t_typ @-> returning (ptr Bytes.t_typ))

let get_contents =
foreign "g_mapped_file_get_contents" (ptr t_typ @-> returning (string))

let get_length =
foreign "g_mapped_file_get_length" (ptr t_typ @-> returning (uint64_t))

let ref =
foreign "g_mapped_file_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
foreign "g_mapped_file_unref" (ptr t_typ @-> returning (void))


