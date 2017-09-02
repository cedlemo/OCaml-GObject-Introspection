open Ctypes
open Foreign

type t
let t_typ : t union typ = union "Token_value"
let f_v_symbol = field t_typ "v_symbol" (ptr void)
let f_v_identifier = field t_typ "v_identifier" (string)
let f_v_binary = field t_typ "v_binary" (uint64_t)
let f_v_octal = field t_typ "v_octal" (uint64_t)
let f_v_int = field t_typ "v_int" (uint64_t)
let f_v_int64 = field t_typ "v_int64" (uint64_t)
let f_v_float = field t_typ "v_float" (double)
let f_v_hex = field t_typ "v_hex" (uint64_t)
let f_v_string = field t_typ "v_string" (string)
let f_v_comment = field t_typ "v_comment" (string)
let f_v_char = field t_typ "v_char" (uint8_t)
let f_v_error = field t_typ "v_error" (uint32_t)

