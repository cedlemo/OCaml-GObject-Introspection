open Ctypes

type t
val t_typ : t structure typ
val f_data: (unit ptr, t structure) field
(* TODO Struct field Hook : interface tag not implemented . *)
(* TODO Struct field Hook : interface tag not implemented . *)
val f_ref_count: (Unsigned.uint32, t structure) field
val f_hook_id: (Unsigned.uint64, t structure) field
val f_flags: (Unsigned.uint32, t structure) field
val f_func: (unit ptr, t structure) field
(* TODO Struct field Hook : interface tag not implemented . *)

