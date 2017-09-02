open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "String_chunk"
let clear =
foreign "g_string_chunk_clear" (ptr t_typ @-> returning (void))
let free =
foreign "g_string_chunk_free" (ptr t_typ @-> returning (void))
let insert =
foreign "g_string_chunk_insert" (ptr t_typ @-> string @-> returning (string))
let insert_const =
foreign "g_string_chunk_insert_const" (ptr t_typ @-> string @-> returning (string))
let insert_len =
foreign "g_string_chunk_insert_len" (ptr t_typ @-> string @-> int64_t @-> returning (string))

