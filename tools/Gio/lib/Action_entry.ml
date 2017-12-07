open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Action_entry"

let f_name = field t_typ "name" (string)
(*Struct field Action_entry : callback tag not implemented*)
let f_parameter_type = field t_typ "parameter_type" (string)
let f_state = field t_typ "state" (string)
(*Struct field Action_entry : callback tag not implemented*)
(*Struct field Action_entry : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ

