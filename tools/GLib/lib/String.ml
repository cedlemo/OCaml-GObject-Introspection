open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "String"
let f_str = field t_typ "str" (string)
let f_len = field t_typ "len" (uint64_t)
let f_allocated_len = field t_typ "allocated_len" (uint64_t)
let append =
foreign "g_string_append" (ptr t_typ @-> string @-> returning (ptr t_typ))

let append_c =
foreign "g_string_append_c" (ptr t_typ @-> int8_t @-> returning (ptr t_typ))

let append_len =
foreign "g_string_append_len" (ptr t_typ @-> string @-> int64_t @-> returning (ptr t_typ))

(*Not implemented g_string_append_unichar argument typeunichar not handled*)
let append_uri_escaped =
foreign "g_string_append_uri_escaped" (ptr t_typ @-> string @-> string @-> bool @-> returning (ptr t_typ))

let ascii_down =
foreign "g_string_ascii_down" (ptr t_typ @-> returning (ptr t_typ))

let ascii_up =
foreign "g_string_ascii_up" (ptr t_typ @-> returning (ptr t_typ))

let assign =
foreign "g_string_assign" (ptr t_typ @-> string @-> returning (ptr t_typ))

let down =
foreign "g_string_down" (ptr t_typ @-> returning (ptr t_typ))

let equal =
foreign "g_string_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))

let erase =
foreign "g_string_erase" (ptr t_typ @-> int64_t @-> int64_t @-> returning (ptr t_typ))

let free =
foreign "g_string_free" (ptr t_typ @-> bool @-> returning (string_opt))

let free_to_bytes =
foreign "g_string_free_to_bytes" (ptr t_typ @-> returning (ptr Bytes.t_typ))

let hash =
foreign "g_string_hash" (ptr t_typ @-> returning (uint32_t))

let insert =
foreign "g_string_insert" (ptr t_typ @-> int64_t @-> string @-> returning (ptr t_typ))

let insert_c =
foreign "g_string_insert_c" (ptr t_typ @-> int64_t @-> int8_t @-> returning (ptr t_typ))

let insert_len =
foreign "g_string_insert_len" (ptr t_typ @-> int64_t @-> string @-> int64_t @-> returning (ptr t_typ))

(*Not implemented g_string_insert_unichar argument typeunichar not handled*)
let overwrite =
foreign "g_string_overwrite" (ptr t_typ @-> uint64_t @-> string @-> returning (ptr t_typ))

let overwrite_len =
foreign "g_string_overwrite_len" (ptr t_typ @-> uint64_t @-> string @-> int64_t @-> returning (ptr t_typ))

let prepend =
foreign "g_string_prepend" (ptr t_typ @-> string @-> returning (ptr t_typ))

let prepend_c =
foreign "g_string_prepend_c" (ptr t_typ @-> int8_t @-> returning (ptr t_typ))

let prepend_len =
foreign "g_string_prepend_len" (ptr t_typ @-> string @-> int64_t @-> returning (ptr t_typ))

(*Not implemented g_string_prepend_unichar argument typeunichar not handled*)
let set_size =
foreign "g_string_set_size" (ptr t_typ @-> uint64_t @-> returning (ptr t_typ))

let truncate =
foreign "g_string_truncate" (ptr t_typ @-> uint64_t @-> returning (ptr t_typ))

let up =
foreign "g_string_up" (ptr t_typ @-> returning (ptr t_typ))


