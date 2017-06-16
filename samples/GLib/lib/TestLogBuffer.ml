open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "TestLogBuffer"
let f_data = field t_typ "data" (ptr )
let f_msgs = field t_typ "msgs" (ptr SList.t_typ)
