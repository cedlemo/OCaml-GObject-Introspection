open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "OptionEntry"
let f_long_name = field t_typ "long_name" (ptr string)
let f_short_name = field t_typ "short_name" (int8_t)
let f_flags = field t_typ "flags" (int32_t)
(* TODO Struct field OptionEntry : interface tag not implemented *)let f_arg_data = field t_typ "arg_data" (ptr void)
let f_description = field t_typ "description" (ptr string)
let f_arg_description = field t_typ "arg_description" (ptr string)

