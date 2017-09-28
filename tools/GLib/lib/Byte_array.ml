open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Byte_array"
let f_data = field t_typ "data" (ptr uint8_t)
let f_len = field t_typ "len" (uint32_t)
let free =
foreign "g_byte_array_free" (ptr t_typ @-> ptr t_typ @-> bool @-> returning (ptr uint8_t))

let free_to_bytes =
foreign "g_byte_array_free_to_bytes" (ptr t_typ @-> ptr t_typ @-> returning (ptr Bytes.t_typ))

let _new =
foreign "g_byte_array_new" (ptr t_typ @-> returning (ptr t_typ))

(*Not implemented g_byte_array_new_take argument types not handled*)
let unref =
foreign "g_byte_array_unref" (ptr t_typ @-> ptr t_typ @-> returning (void))


