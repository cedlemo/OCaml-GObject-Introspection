open Ctypes

type t
val t_typ : t structure typ
val f_seq_id: (Unsigned.uint64, t structure) field
val f_hook_size: (Unsigned.uint32, t structure) field
val f_is_setup: (Unsigned.uint32, t structure) field
(* TODO Struct field HookList : interface tag not implemented *)val f_dummy3: (unit ptr, t structure) field
(* TODO Struct field HookList : interface tag not implemented *)(* TODO Struct field HookList : C Array type for GITypes.Array tag tag not implemented *)
