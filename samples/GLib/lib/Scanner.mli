open Ctypes

type t
val t_typ : t structure typ
val f_user_data: (unit ptr, t structure) field
val f_max_parse_errors: (Unsigned.uint32, t structure) field
val f_parse_errors: (Unsigned.uint32, t structure) field
val f_input_name: (string, t structure) field
(* TODO Struct field Scanner : interface tag not implemented . *)
(* TODO Struct field Scanner : interface tag not implemented . *)
(* TODO Struct field Scanner : interface tag not implemented . *)
(* TODO Struct field Scanner : interface tag not implemented . *)
val f_line: (Unsigned.uint32, t structure) field
val f_position: (Unsigned.uint32, t structure) field
(* TODO Struct field Scanner : interface tag not implemented . *)
(* TODO Struct field Scanner : interface tag not implemented . *)
val f_next_line: (Unsigned.uint32, t structure) field
val f_next_position: (Unsigned.uint32, t structure) field
val f_symbol_table: (HashTable.t structure ptr, t structure) field
val f_input_fd: (int32, t structure) field
val f_text: (string, t structure) field
val f_text_end: (string, t structure) field
val f_buffer: (string, t structure) field
val f_scope_id: (Unsigned.uint32, t structure) field
(* TODO Struct field Scanner : interface tag not implemented . *)

