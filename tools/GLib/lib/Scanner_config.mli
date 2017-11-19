open Ctypes

type t
val t_typ : t structure typ

val f_cset_skip_characters: (string, t structure) field
val f_cset_identifier_first: (string, t structure) field
val f_cset_identifier_nth: (string, t structure) field
val f_cpair_comment_single: (string, t structure) field
val f_case_sensitive: (Unsigned.uint32, t structure) field
val f_skip_comment_multi: (Unsigned.uint32, t structure) field
val f_skip_comment_single: (Unsigned.uint32, t structure) field
val f_scan_comment_multi: (Unsigned.uint32, t structure) field
val f_scan_identifier: (Unsigned.uint32, t structure) field
val f_scan_identifier_1char: (Unsigned.uint32, t structure) field
val f_scan_identifier_NULL: (Unsigned.uint32, t structure) field
val f_scan_symbols: (Unsigned.uint32, t structure) field
val f_scan_binary: (Unsigned.uint32, t structure) field
val f_scan_octal: (Unsigned.uint32, t structure) field
val f_scan_float: (Unsigned.uint32, t structure) field
val f_scan_hex: (Unsigned.uint32, t structure) field
val f_scan_hex_dollar: (Unsigned.uint32, t structure) field
val f_scan_string_sq: (Unsigned.uint32, t structure) field
val f_scan_string_dq: (Unsigned.uint32, t structure) field
val f_numbers_2_int: (Unsigned.uint32, t structure) field
val f_int_2_float: (Unsigned.uint32, t structure) field
val f_identifier_2_string: (Unsigned.uint32, t structure) field
val f_char_2_token: (Unsigned.uint32, t structure) field
val f_symbol_2_token: (Unsigned.uint32, t structure) field
val f_scope_0_fallback: (Unsigned.uint32, t structure) field
val f_store_int64: (Unsigned.uint32, t structure) field
val f_padding_dummy: (Unsigned.uint32, t structure) field

