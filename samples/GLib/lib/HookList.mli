open Ctypes
type t
val hooklist : t structure typ
val seq_id: (Unsigned.uint64, t structure) field
val hook_size: (Unsigned.uint32, t structure) field
val is_setup: (Unsigned.uint32, t structure) field
val hooks: ( ptr, t structure) field
val dummy3: (unit ptr, t structure) field
val finalize_hook: (, t structure) field
val dummy: (Array.t structure, t structure) field
