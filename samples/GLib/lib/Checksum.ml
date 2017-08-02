open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Checksum"
(* Not implemented g_checksum_new argument types not handled . *)
(* Not implemented g_checksum_copy return type not handled . *)
let free =
foreign "g_checksum_free" (ptr t_typ @-> returning (void))
let get_string =
foreign "g_checksum_get_string" (ptr t_typ @-> returning (string))
let reset =
foreign "g_checksum_reset" (ptr t_typ @-> returning (void))
(* Not implemented g_checksum_update argument types not handled . *)
(* Not implemented g_checksum_type_get_length argument types not handled . *)

