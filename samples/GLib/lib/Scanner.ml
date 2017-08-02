open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Scanner"
let f_user_data = field t_typ "user_data" (ptr void)
let f_max_parse_errors = field t_typ "max_parse_errors" (uint32_t)
let f_parse_errors = field t_typ "parse_errors" (uint32_t)
let f_input_name = field t_typ "input_name" (string)
(* TODO Struct field Scanner : interface tag not implemented . *)
(* TODO Struct field Scanner : interface tag not implemented . *)
(* TODO Struct field Scanner : interface tag not implemented . *)
(* TODO Struct field Scanner : interface tag not implemented . *)
let f_line = field t_typ "line" (uint32_t)
let f_position = field t_typ "position" (uint32_t)
(* TODO Struct field Scanner : interface tag not implemented . *)
(* TODO Struct field Scanner : interface tag not implemented . *)
let f_next_line = field t_typ "next_line" (uint32_t)
let f_next_position = field t_typ "next_position" (uint32_t)
let f_symbol_table = field t_typ "symbol_table" (ptr HashTable.t_typ)
let f_input_fd = field t_typ "input_fd" (int32_t)
let f_text = field t_typ "text" (string)
let f_text_end = field t_typ "text_end" (string)
let f_buffer = field t_typ "buffer" (string)
let f_scope_id = field t_typ "scope_id" (uint32_t)
(* TODO Struct field Scanner : interface tag not implemented . *)
let cur_line =
foreign "g_scanner_cur_line" (ptr t_typ @-> returning (uint32_t))
let cur_position =
foreign "g_scanner_cur_position" (ptr t_typ @-> returning (uint32_t))
(* Not implemented g_scanner_cur_token return type not handled . *)
let destroy =
foreign "g_scanner_destroy" (ptr t_typ @-> returning (void))
let eof =
foreign "g_scanner_eof" (ptr t_typ @-> returning (bool))
(* Not implemented g_scanner_get_next_token return type not handled . *)
let input_file =
foreign "g_scanner_input_file" (ptr t_typ @-> int32_t @-> returning (void))
let input_text =
foreign "g_scanner_input_text" (ptr t_typ @-> string @-> uint32_t @-> returning (void))
let lookup_symbol =
foreign "g_scanner_lookup_symbol" (ptr t_typ @-> string @-> returning (ptr void))
(* Not implemented g_scanner_peek_next_token return type not handled . *)
let scope_add_symbol =
foreign "g_scanner_scope_add_symbol" (ptr t_typ @-> uint32_t @-> string @-> ptr void @-> returning (void))
let scope_lookup_symbol =
foreign "g_scanner_scope_lookup_symbol" (ptr t_typ @-> uint32_t @-> string @-> returning (ptr void))
let scope_remove_symbol =
foreign "g_scanner_scope_remove_symbol" (ptr t_typ @-> uint32_t @-> string @-> returning (void))
let set_scope =
foreign "g_scanner_set_scope" (ptr t_typ @-> uint32_t @-> returning (uint32_t))
let sync_file_offset =
foreign "g_scanner_sync_file_offset" (ptr t_typ @-> returning (void))
(* Not implemented g_scanner_unexp_token argument types not handled . *)

