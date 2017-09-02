open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Source_funcs"
(* TODO Struct field Source_funcs : callback tag not implemented . *)
(* TODO Struct field Source_funcs : callback tag not implemented . *)
let f_dispatch = field t_typ "dispatch" (ptr void)
(* TODO Struct field Source_funcs : callback tag not implemented . *)
(* TODO Struct field Source_funcs : callback tag not implemented . *)
(* TODO Struct field Source_funcs : callback tag not implemented . *)

