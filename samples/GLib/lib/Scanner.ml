open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Scanner"
let f_user_data = field t_typ "user_data" (ptr void)
let f_max_parse_errors = field t_typ "max_parse_errors" (uint32_t)
let f_parse_errors = field t_typ "parse_errors" (uint32_t)
let f_input_name = field t_typ "input_name" (ptr string)
let f_line = field t_typ "line" (uint32_t)
let f_position = field t_typ "position" (uint32_t)
let f_next_line = field t_typ "next_line" (uint32_t)
let f_next_position = field t_typ "next_position" (uint32_t)
let f_symbol_table = field t_typ "symbol_table" (ptr HashTable.t_typ)
let f_input_fd = field t_typ "input_fd" (int32_t)
let f_text = field t_typ "text" (ptr string)
let f_text_end = field t_typ "text_end" (ptr string)
let f_buffer = field t_typ "buffer" (ptr string)
let f_scope_id = field t_typ "scope_id" (uint32_t)

