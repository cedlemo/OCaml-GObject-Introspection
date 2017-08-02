open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "IOChannel"
let f_ref_count = field t_typ "ref_count" (int32_t)
(* TODO Struct field IOChannel : interface tag not implemented . *)
let f_encoding = field t_typ "encoding" (string)
(* TODO Struct field IOChannel : interface tag not implemented . *)
(* TODO Struct field IOChannel : interface tag not implemented . *)
let f_line_term = field t_typ "line_term" (string)
let f_line_term_len = field t_typ "line_term_len" (uint32_t)
let f_buf_size = field t_typ "buf_size" (uint64_t)
(* TODO Struct field IOChannel : interface tag not implemented . *)
(* TODO Struct field IOChannel : interface tag not implemented . *)
(* TODO Struct field IOChannel : interface tag not implemented . *)
(* TODO Struct field IOChannel : C Array type for GITypes.Array tag tag not implemented . *)
let f_use_buffer = field t_typ "use_buffer" (uint32_t)
let f_do_encode = field t_typ "do_encode" (uint32_t)
let f_close_on_unref = field t_typ "close_on_unref" (uint32_t)
let f_is_readable = field t_typ "is_readable" (uint32_t)
let f_is_writeable = field t_typ "is_writeable" (uint32_t)
let f_is_seekable = field t_typ "is_seekable" (uint32_t)
let f_reserved1 = field t_typ "reserved1" (ptr void)
let f_reserved2 = field t_typ "reserved2" (ptr void)
(* Not implemented g_io_channel_new_file return type not handled . *)
(* Not implemented g_io_channel_unix_new return type not handled . *)
let close =
foreign "g_io_channel_close" (ptr t_typ @-> returning (void))
(* Not implemented g_io_channel_flush return type not handled . *)
(* Not implemented g_io_channel_get_buffer_condition return type not handled . *)
let get_buffer_size =
foreign "g_io_channel_get_buffer_size" (ptr t_typ @-> returning (uint64_t))
let get_buffered =
foreign "g_io_channel_get_buffered" (ptr t_typ @-> returning (bool))
let get_close_on_unref =
foreign "g_io_channel_get_close_on_unref" (ptr t_typ @-> returning (bool))
let get_encoding =
foreign "g_io_channel_get_encoding" (ptr t_typ @-> returning (string))
(* Not implemented g_io_channel_get_flags return type not handled . *)
let get_line_term =
foreign "g_io_channel_get_line_term" (ptr t_typ @-> ptr int32_t @-> returning (string))
let init =
foreign "g_io_channel_init" (ptr t_typ @-> returning (void))
(* Not implemented g_io_channel_read return type not handled . *)
(* Not implemented g_io_channel_read_chars argument types not handled . *)
(* Not implemented g_io_channel_read_line argument types not handled . *)
(* Not implemented g_io_channel_read_line_string argument types not handled . *)
(* Not implemented g_io_channel_read_to_end argument types not handled . *)
(* Not implemented g_io_channel_read_unichar argument types not handled . *)
(* Not implemented g_io_channel_ref return type not handled . *)
(* Not implemented g_io_channel_seek argument types not handled . *)
(* Not implemented g_io_channel_seek_position argument types not handled . *)
let set_buffer_size =
foreign "g_io_channel_set_buffer_size" (ptr t_typ @-> uint64_t @-> returning (void))
let set_buffered =
foreign "g_io_channel_set_buffered" (ptr t_typ @-> bool @-> returning (void))
let set_close_on_unref =
foreign "g_io_channel_set_close_on_unref" (ptr t_typ @-> bool @-> returning (void))
(* Not implemented g_io_channel_set_encoding return type not handled . *)
(* Not implemented g_io_channel_set_flags argument types not handled . *)
let set_line_term =
foreign "g_io_channel_set_line_term" (ptr t_typ @-> string @-> int32_t @-> returning (void))
(* Not implemented g_io_channel_shutdown return type not handled . *)
let unix_get_fd =
foreign "g_io_channel_unix_get_fd" (ptr t_typ @-> returning (int32_t))
let unref =
foreign "g_io_channel_unref" (ptr t_typ @-> returning (void))
(* Not implemented g_io_channel_write return type not handled . *)
(* Not implemented g_io_channel_write_chars argument types not handled . *)
(* Not implemented g_io_channel_write_unichar argument types not handled . *)
(* Not implemented g_io_channel_error_from_errno return type not handled . *)
let error_quark =
foreign "g_io_channel_error_quark" (ptr t_typ @-> returning (uint32_t))

