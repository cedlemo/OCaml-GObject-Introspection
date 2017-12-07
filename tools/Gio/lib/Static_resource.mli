open Ctypes

type t
val t_typ : t structure typ

val f_data: (Unsigned.uint8 ptr, t structure) field
val f_data_len: (Unsigned.uint64, t structure) field
val f_resource: (Resource.t structure ptr, t structure) field
val f_next: (t structure ptr, t structure) field
val f_padding: (unit ptr, t structure) field

val fini:
  t structure ptr -> unit

val get_resource:
  t structure ptr -> Resource.t structure ptr

val init:
  t structure ptr -> unit

