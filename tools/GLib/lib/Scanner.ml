open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Scanner"
let f_user_data = field t_typ "user_data" (ptr void)
let f_max_parse_errors = field t_typ "max_parse_errors" (uint32_t)
let f_parse_errors = field t_typ "parse_errors" (uint32_t)
let f_input_name = field t_typ "input_name" (string)
let f_qdata = field t_typ "qdata" (ptr Data.t_typ)
let f_config = field t_typ "config" (ptr Scanner_config.t_typ)
let f_token = field t_typ "token" (Token_type.t_view)
(*TODO Struct field Scanner : union tag not implemented*)
let f_line = field t_typ "line" (uint32_t)
let f_position = field t_typ "position" (uint32_t)
let f_next_token = field t_typ "next_token" (Token_type.t_view)
(*TODO Struct field Scanner : union tag not implemented*)
let f_next_line = field t_typ "next_line" (uint32_t)
let f_next_position = field t_typ "next_position" (uint32_t)
let f_symbol_table = field t_typ "symbol_table" (ptr Hash_table.t_typ)
let f_input_fd = field t_typ "input_fd" (int32_t)
let f_text = field t_typ "text" (string)
let f_text_end = field t_typ "text_end" (string)
let f_buffer = field t_typ "buffer" (string)
let f_scope_id = field t_typ "scope_id" (uint32_t)
(*TODO Struct field Scanner : callback tag not implemented*)
let cur_line =
foreign "g_scanner_cur_line" (ptr t_typ @-> returning (uint32_t))

let cur_position =
foreign "g_scanner_cur_position" (ptr t_typ @-> returning (uint32_t))

let cur_token =
foreign "g_scanner_cur_token" (ptr t_typ @-> returning (Token_type.t_view))

let destroy =
foreign "g_scanner_destroy" (ptr t_typ @-> returning (void))

let eof =
foreign "g_scanner_eof" (ptr t_typ @-> returning (bool))

let get_next_token =
foreign "g_scanner_get_next_token" (ptr t_typ @-> returning (Token_type.t_view))

let input_file =
foreign "g_scanner_input_file" (ptr t_typ @-> int32_t @-> returning (void))

let input_text =
foreign "g_scanner_input_text" (ptr t_typ @-> string @-> uint32_t @-> returning (void))

let lookup_symbol =
foreign "g_scanner_lookup_symbol" (ptr t_typ @-> string @-> returning (ptr_opt void))

let peek_next_token =
foreign "g_scanner_peek_next_token" (ptr t_typ @-> returning (Token_type.t_view))

let scope_add_symbol =
foreign "g_scanner_scope_add_symbol" (ptr t_typ @-> uint32_t @-> string @-> ptr_opt void @-> returning (void))

let scope_lookup_symbol =
foreign "g_scanner_scope_lookup_symbol" (ptr t_typ @-> uint32_t @-> string @-> returning (ptr_opt void))

let scope_remove_symbol =
foreign "g_scanner_scope_remove_symbol" (ptr t_typ @-> uint32_t @-> string @-> returning (void))

let set_scope =
foreign "g_scanner_set_scope" (ptr t_typ @-> uint32_t @-> returning (uint32_t))

let sync_file_offset =
foreign "g_scanner_sync_file_offset" (ptr t_typ @-> returning (void))

let unexp_token =
foreign "g_scanner_unexp_token" (ptr t_typ @-> Token_type.t_view @-> string @-> string @-> string @-> string @-> int32_t @-> returning (void))


