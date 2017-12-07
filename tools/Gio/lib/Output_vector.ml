open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Output_vector"

let f_buffer = field t_typ "buffer" (ptr void)
let f_size = field t_typ "size" (uint64_t)
let _ = seal t_typ

