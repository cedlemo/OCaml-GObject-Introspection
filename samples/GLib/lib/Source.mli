open Ctypes
type t
val source : t structure typ
val callback_data: (unit ptr, t structure) field
val callback_funcs: ( ptr, t structure) field
val source_funcs: ( ptr, t structure) field
val ref_count: (Unsigned.uint32, t structure) field
val context: ( ptr, t structure) field
val priority: (int32, t structure) field
val flags: (Unsigned.uint32, t structure) field
val source_id: (Unsigned.uint32, t structure) field
val poll_fds: (SList.t structure ptr, t structure) field
val prev: ( ptr, t structure) field
val next: ( ptr, t structure) field
val name: (string ptr, t structure) field
val priv: ( ptr, t structure) field
