open Ctypes
type t
val scannerconfig : t structure typ
val cset_skip_characters: (string ptr, t structure) field
val cset_identifier_first: (string ptr, t structure) field
val cset_identifier_nth: (string ptr, t structure) field
val cpair_comment_single: (string ptr, t structure) field
val case_sensitive: (Unsigned.uint32, t structure) field
val skip_comment_multi: (Unsigned.uint32, t structure) field
val skip_comment_single: (Unsigned.uint32, t structure) field
val scan_comment_multi: (Unsigned.uint32, t structure) field
val scan_identifier: (Unsigned.uint32, t structure) field
val scan_identifier_1char: (Unsigned.uint32, t structure) field
val scan_identifier_NULL: (Unsigned.uint32, t structure) field
val scan_symbols: (Unsigned.uint32, t structure) field
val scan_binary: (Unsigned.uint32, t structure) field
val scan_octal: (Unsigned.uint32, t structure) field
val scan_float: (Unsigned.uint32, t structure) field
val scan_hex: (Unsigned.uint32, t structure) field
val scan_hex_dollar: (Unsigned.uint32, t structure) field
val scan_string_sq: (Unsigned.uint32, t structure) field
val scan_string_dq: (Unsigned.uint32, t structure) field
val numbers_2_int: (Unsigned.uint32, t structure) field
val int_2_float: (Unsigned.uint32, t structure) field
val identifier_2_string: (Unsigned.uint32, t structure) field
val char_2_token: (Unsigned.uint32, t structure) field
val symbol_2_token: (Unsigned.uint32, t structure) field
val scope_0_fallback: (Unsigned.uint32, t structure) field
val store_int64: (Unsigned.uint32, t structure) field
val padding_dummy: (Unsigned.uint32, t structure) field
