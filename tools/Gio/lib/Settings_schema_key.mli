open Ctypes

type t
val t_typ : t structure typ

val get_default_value:
  t structure ptr -> Variant.t structure ptr

val get_description:
  t structure ptr -> string

val get_name:
  t structure ptr -> string

val get_range:
  t structure ptr -> Variant.t structure ptr

val get_summary:
  t structure ptr -> string

val get_value_type:
  t structure ptr -> Variant_type.t structure ptr

val range_check:
  t structure ptr -> Variant.t structure ptr -> bool

val ref:
  t structure ptr -> t structure ptr

val unref:
  t structure ptr -> unit

