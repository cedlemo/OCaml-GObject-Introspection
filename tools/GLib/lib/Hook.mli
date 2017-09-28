open Ctypes

type t
val t_typ : t structure typ
val f_data: (unit ptr, t structure) field
val f_next: ((* interface *) Hook.t structure ptr, t structure) field
val f_prev: ((* interface *) Hook.t structure ptr, t structure) field
val f_ref_count: (Unsigned.uint32, t structure) field
val f_hook_id: (Unsigned.uint64, t structure) field
val f_flags: (Unsigned.uint32, t structure) field
val f_func: (unit ptr, t structure) field
(*TODO Struct field Hook : callback tag not implemented*)
val compare_ids:
t structure ptr -> (* interface *) t structure ptr -> int32

val destroy:
t structure ptr -> (* interface *) Hook_list.t structure ptr -> Unsigned.uint64 -> bool

val destroy_link:
t structure ptr -> (* interface *) Hook_list.t structure ptr -> (* interface *) t structure ptr -> unit

val free:
t structure ptr -> (* interface *) Hook_list.t structure ptr -> (* interface *) t structure ptr -> unit

val insert_before:
t structure ptr -> (* interface *) Hook_list.t structure ptr -> (* interface *) t structure ptr option -> (* interface *) t structure ptr -> unit

val prepend:
t structure ptr -> (* interface *) Hook_list.t structure ptr -> (* interface *) t structure ptr -> unit

val unref:
t structure ptr -> (* interface *) Hook_list.t structure ptr -> (* interface *) t structure ptr -> unit


