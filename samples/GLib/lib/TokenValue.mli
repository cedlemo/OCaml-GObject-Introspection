open Ctypes
type t
val tokenvalue : t union typ
val v_symbol: (unit ptr, t union) field
val v_identifier: (string ptr, t union) field
val v_binary: (Unsigned.uint64, t union) field
val v_octal: (Unsigned.uint64, t union) field
val v_int: (Unsigned.uint64, t union) field
val v_int64: (Unsigned.uint64, t union) field
val v_float: (float, t union) field
val v_hex: (Unsigned.uint64, t union) field
val v_string: (string ptr, t union) field
val v_comment: (string ptr, t union) field
val v_char: (Unsigned.uint8, t union) field
val v_error: (Unsigned.uint32, t union) field
