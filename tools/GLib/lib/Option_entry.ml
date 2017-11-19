open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Option_entry"

let f_long_name = field t_typ "long_name" (string)
let f_short_name = field t_typ "short_name" (int8_t)
let f_flags = field t_typ "flags" (int32_t)
let f_arg = field t_typ "arg" (Option_arg.t_view)
let f_arg_data = field t_typ "arg_data" (ptr void)
let f_description = field t_typ "description" (string)
let f_arg_description = field t_typ "arg_description" (string)
let _ = seal t_typ

