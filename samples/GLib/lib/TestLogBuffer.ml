open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "TestLogBuffer"
(* TODO Struct field TestLogBuffer : interface tag not implemented *)let f_msgs = field t_typ "msgs" (ptr SList.t_typ)

