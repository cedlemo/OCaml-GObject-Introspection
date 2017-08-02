open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Node"
let f_data = field t_typ "data" (ptr void)
(* TODO Struct field Node : interface tag not implemented . *)
(* TODO Struct field Node : interface tag not implemented . *)
(* TODO Struct field Node : interface tag not implemented . *)
(* TODO Struct field Node : interface tag not implemented . *)

