open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Checksum"
let _new =
  foreign "g_checksum_new" (ptr t_typ @-> Checksum_type.t_view @-> returning (ptr t_typ))

let copy =
  foreign "g_checksum_copy" (ptr t_typ @-> returning (ptr t_typ))

let free =
  foreign "g_checksum_free" (ptr t_typ @-> returning (void))

let get_string =
  foreign "g_checksum_get_string" (ptr t_typ @-> returning (string))

let reset =
  foreign "g_checksum_reset" (ptr t_typ @-> returning (void))

(*Not implemented g_checksum_update argument typeC Array type for Types.Array tag not handled*)
let type_get_length =
  foreign "g_checksum_type_get_length" (ptr t_typ @-> Checksum_type.t_view @-> returning (int64_t))


