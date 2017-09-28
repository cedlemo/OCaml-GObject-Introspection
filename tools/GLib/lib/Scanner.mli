open Ctypes

type t
val t_typ : t structure typ
val f_user_data: (unit ptr, t structure) field
val f_max_parse_errors: (Unsigned.uint32, t structure) field
val f_parse_errors: (Unsigned.uint32, t structure) field
val f_input_name: (string, t structure) field
val f_qdata: (Data.t structure ptr, t structure) field
val f_config: (Scanner_config.t structure ptr, t structure) field
val f_token: (Token_type.t, t structure) field
(*TODO Struct field Scanner : union tag not implemented*)
val f_line: (Unsigned.uint32, t structure) field
val f_position: (Unsigned.uint32, t structure) field
val f_next_token: (Token_type.t, t structure) field
(*TODO Struct field Scanner : union tag not implemented*)
val f_next_line: (Unsigned.uint32, t structure) field
val f_next_position: (Unsigned.uint32, t structure) field
val f_symbol_table: (Hash_table.t structure ptr, t structure) field
val f_input_fd: (int32, t structure) field
val f_text: (string, t structure) field
val f_text_end: (string, t structure) field
val f_buffer: (string, t structure) field
val f_scope_id: (Unsigned.uint32, t structure) field
(*TODO Struct field Scanner : callback tag not implemented*)
val cur_line:
t structure ptr -> Unsigned.uint32

val cur_position:
t structure ptr -> Unsigned.uint32

val cur_token:
t structure ptr -> Token_type.t

val destroy:
t structure ptr -> unit

val eof:
t structure ptr -> bool

val get_next_token:
t structure ptr -> Token_type.t

val input_file:
t structure ptr -> int32 -> unit

val input_text:
t structure ptr -> string -> Unsigned.uint32 -> unit

val lookup_symbol:
t structure ptr -> string -> unit ptr option

val peek_next_token:
t structure ptr -> Token_type.t

val scope_add_symbol:
t structure ptr -> Unsigned.uint32 -> string -> unit ptr option -> unit

val scope_lookup_symbol:
t structure ptr -> Unsigned.uint32 -> string -> unit ptr option

val scope_remove_symbol:
t structure ptr -> Unsigned.uint32 -> string -> unit

val set_scope:
t structure ptr -> Unsigned.uint32 -> Unsigned.uint32

val sync_file_offset:
t structure ptr -> unit

val unexp_token:
t structure ptr -> Token_type.t -> string -> string -> string -> string -> int32 -> unit


