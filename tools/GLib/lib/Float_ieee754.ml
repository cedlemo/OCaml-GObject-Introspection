open Ctypes
open Foreign

type t
let t_typ : t union typ = union "Float_ieee754"
let f_v_float = field t_typ "v_float" (float)
let _ = seal t_typ

