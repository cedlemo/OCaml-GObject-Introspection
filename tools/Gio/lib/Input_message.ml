open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Input_message"

(*Struct field Input_message : object tag not implemented*)
(*Struct field Input_message : C Array type for Types.Array tag tag not implemented*)
let f_num_vectors = field t_typ "num_vectors" (uint32_t)
let f_bytes_received = field t_typ "bytes_received" (uint64_t)
let f_flags = field t_typ "flags" (int32_t)
(*Struct field Input_message : C Array type for Types.Array tag tag not implemented*)
let f_num_control_messages = field t_typ "num_control_messages" (ptr uint32_t)
let _ = seal t_typ

