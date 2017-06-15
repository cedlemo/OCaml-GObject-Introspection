open Ctypes
type t
val hook : t structure typ
val data: (unit ptr, t structure) field
val next: ( ptr, t structure) field
val prev: ( ptr, t structure) field
val ref_count: (Unsigned.uint32, t structure) field
val hook_id: (Unsigned.uint64, t structure) field
val flags: (Unsigned.uint32, t structure) field
val func: (unit ptr, t structure) field
val destroy: (, t structure) field
