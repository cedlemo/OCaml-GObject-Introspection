open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Log_field"
let f_key = field t_typ "key" (string)
let f_value = field t_typ "value" (ptr void)
let f_length = field t_typ "length" (int64_t)

