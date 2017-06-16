open Ctypes
type t
val t_typ : t structure typ
val f_user_data: (unit ptr, t structure) field
val f_max_parse_errors: (Unsigned.uint32, t structure) field
val f_parse_errors: (Unsigned.uint32, t structure) field
val f_input_name: (string ptr, t structure) field
val f_qdata: ( ptr, t structure) field
val f_config: ( ptr, t structure) field
val f_token: (, t structure) field
val f_value: (, t structure) field
val f_line: (Unsigned.uint32, t structure) field
val f_position: (Unsigned.uint32, t structure) field
val f_next_token: (, t structure) field
val f_next_value: (, t structure) field
val f_next_line: (Unsigned.uint32, t structure) field
val f_next_position: (Unsigned.uint32, t structure) field
val f_symbol_table: (Hash.t structure ptr, t structure) field
val f_input_fd: (int32, t structure) field
val f_text: (string ptr, t structure) field
val f_text_end: (string ptr, t structure) field
val f_buffer: (string ptr, t structure) field
val f_scope_id: (Unsigned.uint32, t structure) field
val f_msg_handler: (, t structure) field
