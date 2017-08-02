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
(* Not implemented g_io_channel_new_file return type not handled . *)
(* Not implemented g_io_channel_unix_new return type not handled . *)
val close:
t structure ptr -> unit
(* Not implemented g_io_channel_flush return type not handled . *)
(* Not implemented g_io_channel_get_buffer_condition return type not handled . *)
val get_buffer_size:
t structure ptr -> Unsigned.uint64
val get_buffered:
t structure ptr -> bool
val get_close_on_unref:
t structure ptr -> bool
val get_encoding:
t structure ptr -> string
(* Not implemented g_io_channel_get_flags return type not handled . *)
val get_line_term:
t structure ptr -> int32 ptr -> string
val init:
t structure ptr -> unit
(* Not implemented g_io_channel_read return type not handled . *)
(* Not implemented g_io_channel_read_chars argument types not handled . *)
(* Not implemented g_io_channel_read_line argument types not handled . *)
(* Not implemented g_io_channel_read_line_string argument types not handled . *)
(* Not implemented g_io_channel_read_to_end argument types not handled . *)
(* Not implemented g_io_channel_read_unichar argument types not handled . *)
(* Not implemented g_io_channel_ref return type not handled . *)
(* Not implemented g_io_channel_seek argument types not handled . *)
(* Not implemented g_io_channel_seek_position argument types not handled . *)
val set_buffer_size:
t structure ptr -> Unsigned.uint64 -> unit
val set_buffered:
t structure ptr -> bool -> unit
val set_close_on_unref:
t structure ptr -> bool -> unit
(* Not implemented g_io_channel_set_encoding return type not handled . *)
(* Not implemented g_io_channel_set_flags argument types not handled . *)
val set_line_term:
t structure ptr -> string -> int32 -> unit
(* Not implemented g_io_channel_shutdown return type not handled . *)
val unix_get_fd:
t structure ptr -> int32
val unref:
t structure ptr -> unit
(* Not implemented g_io_channel_write return type not handled . *)
(* Not implemented g_io_channel_write_chars argument types not handled . *)
(* Not implemented g_io_channel_write_unichar argument types not handled . *)
(* Not implemented g_io_channel_error_from_errno return type not handled . *)
val error_quark:
t structure ptr -> Unsigned.uint32

