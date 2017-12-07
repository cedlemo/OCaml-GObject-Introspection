open Ctypes

type t
val t_typ : t structure typ

val f_infos: (File_attribute_info.t structure ptr, t structure) field
val f_n_infos: (int32, t structure) field

val create:
  unit -> t structure ptr

val add:
  t structure ptr -> string -> File_attribute_type.t -> File_attribute_info_flags.t_list -> unit

val dup:
  t structure ptr -> t structure ptr

val lookup:
  t structure ptr -> string -> File_attribute_info.t structure ptr

val ref:
  t structure ptr -> t structure ptr

val unref:
  t structure ptr -> unit

