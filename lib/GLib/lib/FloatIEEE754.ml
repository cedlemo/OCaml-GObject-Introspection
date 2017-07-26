open Ctypes
open Foreign

type t
let t_typ : t union typ = union "FloatIEEE754"
let f_v_float = field t_typ "v_float" (float)

