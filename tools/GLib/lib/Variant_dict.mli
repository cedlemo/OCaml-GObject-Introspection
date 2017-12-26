open Ctypes

type t
val t_typ : t structure typ

val create:
  Variant.t structure ptr option -> t structure ptr
val clear:
  t structure ptr -> unit
val contains:
  t structure ptr -> string -> bool
val _end:
  t structure ptr -> Variant.t structure ptr
val insert_value:
  t structure ptr -> string -> Variant.t structure ptr -> unit
val lookup_value:
  t structure ptr -> string -> Variant_type.t structure ptr option -> Variant.t structure ptr
val ref:
  t structure ptr -> t structure ptr
val remove:
  t structure ptr -> string -> bool
val unref:
  t structure ptr -> unit
