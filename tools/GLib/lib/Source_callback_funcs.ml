open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Source_callback_funcs"
(*TODO Struct field Source_callback_funcs : callback tag not implemented*)
(*TODO Struct field Source_callback_funcs : callback tag not implemented*)
let f_get = field t_typ "get" (ptr void)

