open Ctypes
open Foreign

type t
let t_typ : t union typ = union "Double_ieee754"
let f_v_double = field t_typ "v_double" (double)

