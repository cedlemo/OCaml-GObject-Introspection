open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "ScannerConfig"
let f_cset_skip_characters = field t_typ "cset_skip_characters" (string)
let f_cset_identifier_first = field t_typ "cset_identifier_first" (string)
let f_cset_identifier_nth = field t_typ "cset_identifier_nth" (string)
let f_cpair_comment_single = field t_typ "cpair_comment_single" (string)
let f_case_sensitive = field t_typ "case_sensitive" (uint32_t)
let f_skip_comment_multi = field t_typ "skip_comment_multi" (uint32_t)
let f_skip_comment_single = field t_typ "skip_comment_single" (uint32_t)
let f_scan_comment_multi = field t_typ "scan_comment_multi" (uint32_t)
let f_scan_identifier = field t_typ "scan_identifier" (uint32_t)
let f_scan_identifier_1char = field t_typ "scan_identifier_1char" (uint32_t)
let f_scan_identifier_NULL = field t_typ "scan_identifier_NULL" (uint32_t)
let f_scan_symbols = field t_typ "scan_symbols" (uint32_t)
let f_scan_binary = field t_typ "scan_binary" (uint32_t)
let f_scan_octal = field t_typ "scan_octal" (uint32_t)
let f_scan_float = field t_typ "scan_float" (uint32_t)
let f_scan_hex = field t_typ "scan_hex" (uint32_t)
let f_scan_hex_dollar = field t_typ "scan_hex_dollar" (uint32_t)
let f_scan_string_sq = field t_typ "scan_string_sq" (uint32_t)
let f_scan_string_dq = field t_typ "scan_string_dq" (uint32_t)
let f_numbers_2_int = field t_typ "numbers_2_int" (uint32_t)
let f_int_2_float = field t_typ "int_2_float" (uint32_t)
let f_identifier_2_string = field t_typ "identifier_2_string" (uint32_t)
let f_char_2_token = field t_typ "char_2_token" (uint32_t)
let f_symbol_2_token = field t_typ "symbol_2_token" (uint32_t)
let f_scope_0_fallback = field t_typ "scope_0_fallback" (uint32_t)
let f_store_int64 = field t_typ "store_int64" (uint32_t)
let f_padding_dummy = field t_typ "padding_dummy" (uint32_t)

