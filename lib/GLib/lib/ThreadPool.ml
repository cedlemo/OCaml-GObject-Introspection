open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "ThreadPool"
(* TODO Struct field ThreadPool : interface tag not implemented *)let f_user_data = field t_typ "user_data" (ptr void)
let f_exclusive = field t_typ "exclusive" (bool)

