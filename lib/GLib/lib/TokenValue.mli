open Ctypes

type t
val t_typ : t union typ
val f_v_symbol: (unit ptr, t union) field
val f_v_identifier: (string ptr, t union) field
val f_v_binary: (Unsigned.uint64, t union) field
val f_v_octal: (Unsigned.uint64, t union) field
val f_v_int: (Unsigned.uint64, t union) field
val f_v_int64: (Unsigned.uint64, t union) field
val f_v_float: (float, t union) field
val f_v_hex: (Unsigned.uint64, t union) field
val f_v_string: (string ptr, t union) field
val f_v_comment: (string ptr, t union) field
val f_v_char: (Unsigned.uint8, t union) field
val f_v_error: (Unsigned.uint32, t union) field

