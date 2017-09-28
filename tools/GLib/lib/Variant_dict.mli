open Ctypes

type t
val t_typ : t structure typ
val _new:
t structure ptr -> (* interface *) Variant.t structure ptr option -> (* interface *) t structure ptr

val clear:
t structure ptr -> unit

val contains:
t structure ptr -> string -> bool

val _end:
t structure ptr -> (* interface *) Variant.t structure ptr

val insert_value:
t structure ptr -> string -> (* interface *) Variant.t structure ptr -> unit

val lookup_value:
t structure ptr -> string -> (* interface *) Variant_type.t structure ptr option -> (* interface *) Variant.t structure ptr

val ref:
t structure ptr -> (* interface *) t structure ptr

val remove:
t structure ptr -> string -> bool

val unref:
t structure ptr -> unit


