open Ctypes

type t
val t_typ : t structure typ
val f_callback_data: (unit ptr, t structure) field
(* TODO Struct field Source : interface tag not implemented *)(* TODO Struct field Source : interface tag not implemented *)val f_ref_count: (Unsigned.uint32, t structure) field
(* TODO Struct field Source : interface tag not implemented *)val f_priority: (int32, t structure) field
val f_flags: (Unsigned.uint32, t structure) field
val f_source_id: (Unsigned.uint32, t structure) field
val f_poll_fds: (SList.t structure ptr, t structure) field
(* TODO Struct field Source : interface tag not implemented *)(* TODO Struct field Source : interface tag not implemented *)val f_name: (string ptr, t structure) field
(* TODO Struct field Source : interface tag not implemented *)
