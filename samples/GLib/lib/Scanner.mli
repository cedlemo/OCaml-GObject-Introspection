open Ctypes
type t
val scanner : t structure typ
val user_data: (unit ptr, t structure) field
val max_parse_errors: (Unsigned.uint32, t structure) field
val parse_errors: (Unsigned.uint32, t structure) field
val input_name: (string ptr, t structure) field
val qdata: ( ptr, t structure) field
val config: ( ptr, t structure) field
val token: (, t structure) field
val value: (, t structure) field
val line: (Unsigned.uint32, t structure) field
val position: (Unsigned.uint32, t structure) field
val next_token: (, t structure) field
val next_value: (, t structure) field
val next_line: (Unsigned.uint32, t structure) field
val next_position: (Unsigned.uint32, t structure) field
val symbol_table: (Hash.t structure ptr, t structure) field
val input_fd: (int32, t structure) field
val text: (string ptr, t structure) field
val text_end: (string ptr, t structure) field
val buffer: (string ptr, t structure) field
val scope_id: (Unsigned.uint32, t structure) field
val msg_handler: (, t structure) field
