open Ctypes
open Foreign
type t
let t_typ : t union typ = union "DoubleIEEE754"
let f_v_double = field t_typ "v_double" (double)
