open Ctypes

type t
val t_typ : t structure typ

val f_name: (string, t structure) field
(*Struct field Action_entry : callback tag not implemented*)
val f_parameter_type: (string, t structure) field
val f_state: (string, t structure) field
(*Struct field Action_entry : callback tag not implemented*)
(*Struct field Action_entry : C Array type for Types.Array tag tag not implemented*)

