open Ctypes
open Foreign

type t
let t_typ : t union typ = union "Mutex"
let f_p = field t_typ "p" (ptr void)
let f_i = field t_typ "i" (Array.t_typ)

