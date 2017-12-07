open Ctypes

type t
val t_typ : t structure typ

(*Struct field Input_message : object tag not implemented*)
(*Struct field Input_message : C Array type for Types.Array tag tag not implemented*)
val f_num_vectors: (Unsigned.uint32, t structure) field
val f_bytes_received: (Unsigned.uint64, t structure) field
val f_flags: (int32, t structure) field
(*Struct field Input_message : C Array type for Types.Array tag tag not implemented*)
val f_num_control_messages: (Unsigned.uint32 ptr, t structure) field

