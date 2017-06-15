open Ctypes
open Foreign
type t
let scanner : t structure typ = structure "Scanner"
let user_data = field scanner "user_data" (ptr void)
let max_parse_errors = field scanner "max_parse_errors" (uint32_t)
let parse_errors = field scanner "parse_errors" (uint32_t)
let input_name = field scanner "input_name" (ptr string)
let qdata = field scanner "qdata" (ptr )
let config = field scanner "config" (ptr )
let token = field scanner "token" ()
let value = field scanner "value" ()
let line = field scanner "line" (uint32_t)
let position = field scanner "position" (uint32_t)
let next_token = field scanner "next_token" ()
let next_value = field scanner "next_value" ()
let next_line = field scanner "next_line" (uint32_t)
let next_position = field scanner "next_position" (uint32_t)
let symbol_table = field scanner "symbol_table" (ptr Hash.hash)
let input_fd = field scanner "input_fd" (int32_t)
let text = field scanner "text" (ptr string)
let text_end = field scanner "text_end" (ptr string)
let buffer = field scanner "buffer" (ptr string)
let scope_id = field scanner "scope_id" (uint32_t)
let msg_handler = field scanner "msg_handler" ()
let _ = seal scanner
