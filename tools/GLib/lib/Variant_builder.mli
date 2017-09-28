open Ctypes

type t
val t_typ : t structure typ
val _new:
t structure ptr -> (* interface *) Variant_type.t structure ptr -> (* interface *) t structure ptr

val add_value:
t structure ptr -> (* interface *) Variant.t structure ptr -> unit

val close:
t structure ptr -> unit

val _end:
t structure ptr -> (* interface *) Variant.t structure ptr

val _open:
t structure ptr -> (* interface *) Variant_type.t structure ptr -> unit

val ref:
t structure ptr -> (* interface *) t structure ptr

val unref:
t structure ptr -> unit


