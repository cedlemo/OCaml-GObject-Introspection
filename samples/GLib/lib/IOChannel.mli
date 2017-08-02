open Ctypes

type t
val t_typ : t structure typ
val f_ref_count: (int32, t structure) field
(* TODO Struct field IOChannel : interface tag not implemented . *)
val f_encoding: (string, t structure) field
(* TODO Struct field IOChannel : interface tag not implemented . *)
(* TODO Struct field IOChannel : interface tag not implemented . *)
val f_line_term: (string, t structure) field
val f_line_term_len: (Unsigned.uint32, t structure) field
val f_buf_size: (Unsigned.uint64, t structure) field
(* TODO Struct field IOChannel : interface tag not implemented . *)
(* TODO Struct field IOChannel : interface tag not implemented . *)
(* TODO Struct field IOChannel : interface tag not implemented . *)
(* TODO Struct field IOChannel : C Array type for GITypes.Array tag tag not implemented . *)
val f_use_buffer: (Unsigned.uint32, t structure) field
val f_do_encode: (Unsigned.uint32, t structure) field
val f_close_on_unref: (Unsigned.uint32, t structure) field
val f_is_readable: (Unsigned.uint32, t structure) field
val f_is_writeable: (Unsigned.uint32, t structure) field
val f_is_seekable: (Unsigned.uint32, t structure) field
val f_reserved1: (unit ptr, t structure) field
val f_reserved2: (unit ptr, t structure) field

