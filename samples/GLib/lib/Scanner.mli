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
val cur_line:
t structure ptr -> Unsigned.uint32
val cur_position:
t structure ptr -> Unsigned.uint32
(* Not implemented g_scanner_cur_token return type not handled . *)
val destroy:
t structure ptr -> unit
val eof:
t structure ptr -> bool
(* Not implemented g_scanner_get_next_token return type not handled . *)
val input_file:
t structure ptr -> int32 -> unit
val input_text:
t structure ptr -> string -> Unsigned.uint32 -> unit
val lookup_symbol:
t structure ptr -> string -> unit ptr
(* Not implemented g_scanner_peek_next_token return type not handled . *)
val scope_add_symbol:
t structure ptr -> Unsigned.uint32 -> string -> unit ptr -> unit
val scope_lookup_symbol:
t structure ptr -> Unsigned.uint32 -> string -> unit ptr
val scope_remove_symbol:
t structure ptr -> Unsigned.uint32 -> string -> unit
val set_scope:
t structure ptr -> Unsigned.uint32 -> Unsigned.uint32
val sync_file_offset:
t structure ptr -> unit
(* Not implemented g_scanner_unexp_token argument types not handled . *)

