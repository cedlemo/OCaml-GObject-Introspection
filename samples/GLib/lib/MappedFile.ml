open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "MappedFile"
(* Not implemented g_mapped_file_new return type not handled . *)
(* Not implemented g_mapped_file_new_from_fd return type not handled . *)
let free =
foreign "g_mapped_file_free" (ptr t_typ @-> returning (void))
(* Not implemented g_mapped_file_get_bytes return type not handled . *)
(* Not implemented g_mapped_file_get_contents return type not handled . *)
let get_length =
foreign "g_mapped_file_get_length" (ptr t_typ @-> returning (uint64_t))
(* Not implemented g_mapped_file_ref return type not handled . *)
let unref =
foreign "g_mapped_file_unref" (ptr t_typ @-> returning (void))

