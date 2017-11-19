open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Source_funcs"

(*Struct field Source_funcs : callback tag not implemented*)
(*Struct field Source_funcs : callback tag not implemented*)
let f_dispatch = field t_typ "dispatch" (ptr void)
(*Struct field Source_funcs : callback tag not implemented*)
(*Struct field Source_funcs : callback tag not implemented*)
(*Struct field Source_funcs : callback tag not implemented*)
let _ = seal t_typ

