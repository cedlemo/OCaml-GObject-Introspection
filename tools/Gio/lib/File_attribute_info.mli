open Ctypes

type t
val t_typ : t structure typ

val f_name: (string, t structure) field
val f_type: (File_attribute_type.t, t structure) field
val f_flags: (File_attribute_info_flags.t_list, t structure) field

