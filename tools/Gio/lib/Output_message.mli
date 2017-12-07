open Ctypes

type t
val t_typ : t structure typ

(*Struct field Output_message : object tag not implemented*)
val f_vectors: (Output_vector.t structure ptr, t structure) field
val f_num_vectors: (Unsigned.uint32, t structure) field
val f_bytes_sent: (Unsigned.uint32, t structure) field
(*Struct field Output_message : C Array type for Types.Array tag tag not implemented*)
val f_num_control_messages: (Unsigned.uint32, t structure) field

