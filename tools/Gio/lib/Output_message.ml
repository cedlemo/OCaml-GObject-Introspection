open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Output_message"

(*Struct field Output_message : object tag not implemented*)
let f_vectors = field t_typ "vectors" (ptr Output_vector.t_typ)
let f_num_vectors = field t_typ "num_vectors" (uint32_t)
let f_bytes_sent = field t_typ "bytes_sent" (uint32_t)
(*Struct field Output_message : C Array type for Types.Array tag tag not implemented*)
let f_num_control_messages = field t_typ "num_control_messages" (uint32_t)
let _ = seal t_typ

