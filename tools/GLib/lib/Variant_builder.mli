open Ctypes

type t
val t_typ : t structure typ

val create:
  Variant_type.t structure ptr -> t structure ptr
val add_value:
  t structure ptr -> Variant.t structure ptr -> unit
val close:
  t structure ptr -> unit
val _end:
  t structure ptr -> Variant.t structure ptr
val _open:
  t structure ptr -> Variant_type.t structure ptr -> unit
val ref:
  t structure ptr -> t structure ptr
val unref:
  t structure ptr -> unit
