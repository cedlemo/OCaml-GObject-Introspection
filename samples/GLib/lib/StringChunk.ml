open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "StringChunk"
let clear =
foreign "g_string_chunk_clear" (ptr t_typ @-> returning (void))
let free =
foreign "g_string_chunk_free" (ptr t_typ @-> returning (void))
(* Not implemented g_string_chunk_insert return type not handled . *)
(* Not implemented g_string_chunk_insert_const return type not handled . *)
(* Not implemented g_string_chunk_insert_len return type not handled . *)

