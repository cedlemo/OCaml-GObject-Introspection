open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "IOChannel"
let f_ref_count = field t_typ "ref_count" (int32_t)
let f_funcs = field t_typ "funcs" (ptr (* interface *) IOFuncs.t_typ)
let f_encoding = field t_typ "encoding" (string)
let f_read_cd = field t_typ "read_cd" (ptr (* interface *) IConv.t_typ)
let f_write_cd = field t_typ "write_cd" (ptr (* interface *) IConv.t_typ)
let f_line_term = field t_typ "line_term" (string)
let f_line_term_len = field t_typ "line_term_len" (uint32_t)
let f_buf_size = field t_typ "buf_size" (uint64_t)
let f_read_buf = field t_typ "read_buf" (ptr (* interface *) String.t_typ)
let f_encoded_read_buf = field t_typ "encoded_read_buf" (ptr (* interface *) String.t_typ)
let f_write_buf = field t_typ "write_buf" (ptr (* interface *) String.t_typ)
(*TODO Struct field IOChannel : C Array type for Types.Array tag tag not implemented*)
let f_use_buffer = field t_typ "use_buffer" (uint32_t)
let f_do_encode = field t_typ "do_encode" (uint32_t)
let f_close_on_unref = field t_typ "close_on_unref" (uint32_t)
let f_is_readable = field t_typ "is_readable" (uint32_t)
let f_is_writeable = field t_typ "is_writeable" (uint32_t)
let f_is_seekable = field t_typ "is_seekable" (uint32_t)
let f_reserved1 = field t_typ "reserved1" (ptr void)
let f_reserved2 = field t_typ "reserved2" (ptr void)
let new_file =
foreign "g_io_channel_new_file" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (ptr (* interface *) t_typ))

let unix_new =
foreign "g_io_channel_unix_new" (ptr t_typ @-> int32_t @-> returning (ptr (* interface *) t_typ))

let close =
foreign "g_io_channel_close" (ptr t_typ @-> returning (void))

let flush =
foreign "g_io_channel_flush" (ptr t_typ  @-> ptr_opt (ptr Error.t_typ) @-> returning ((* interface *) IOStatus.t_view))

let get_buffer_condition =
foreign "g_io_channel_get_buffer_condition" (ptr t_typ @-> returning ((* interface *) IOCondition.t_list_view))

let get_buffer_size =
foreign "g_io_channel_get_buffer_size" (ptr t_typ @-> returning (uint64_t))

let get_buffered =
foreign "g_io_channel_get_buffered" (ptr t_typ @-> returning (bool))

let get_close_on_unref =
foreign "g_io_channel_get_close_on_unref" (ptr t_typ @-> returning (bool))

let get_encoding =
foreign "g_io_channel_get_encoding" (ptr t_typ @-> returning (string))

let get_flags =
foreign "g_io_channel_get_flags" (ptr t_typ @-> returning ((* interface *) IOFlags.t_list_view))

let get_line_term =
foreign "g_io_channel_get_line_term" (ptr t_typ @-> ptr int32_t @-> returning (string))

let init =
foreign "g_io_channel_init" (ptr t_typ @-> returning (void))

let read =
foreign "g_io_channel_read" (ptr t_typ @-> string @-> uint64_t @-> ptr uint64_t @-> returning ((* interface *) IOError.t_view))

(*Not implemented g_io_channel_read_chars argument types not handled*)
(*Not implemented g_io_channel_read_line argument types not handled*)
let read_line_string =
foreign "g_io_channel_read_line_string" (ptr t_typ @-> ptr (* interface *) String.t_typ @-> ptr_opt uint64_t  @-> ptr_opt (ptr Error.t_typ) @-> returning ((* interface *) IOStatus.t_view))

(*Not implemented g_io_channel_read_to_end argument types not handled*)
(*Not implemented g_io_channel_read_unichar argument types not handled*)
let ref =
foreign "g_io_channel_ref" (ptr t_typ @-> returning (ptr (* interface *) t_typ))

let seek =
foreign "g_io_channel_seek" (ptr t_typ @-> int64_t @-> (* interface *) Seek_type.t_view @-> returning ((* interface *) IOError.t_view))

let seek_position =
foreign "g_io_channel_seek_position" (ptr t_typ @-> int64_t @-> (* interface *) Seek_type.t_view  @-> ptr_opt (ptr Error.t_typ) @-> returning ((* interface *) IOStatus.t_view))

let set_buffer_size =
foreign "g_io_channel_set_buffer_size" (ptr t_typ @-> uint64_t @-> returning (void))

let set_buffered =
foreign "g_io_channel_set_buffered" (ptr t_typ @-> bool @-> returning (void))

let set_close_on_unref =
foreign "g_io_channel_set_close_on_unref" (ptr t_typ @-> bool @-> returning (void))

let set_encoding =
foreign "g_io_channel_set_encoding" (ptr t_typ @-> string_opt  @-> ptr_opt (ptr Error.t_typ) @-> returning ((* interface *) IOStatus.t_view))

let set_flags =
foreign "g_io_channel_set_flags" (ptr t_typ @-> (* interface *) IOFlags.t_list_view  @-> ptr_opt (ptr Error.t_typ) @-> returning ((* interface *) IOStatus.t_view))

let set_line_term =
foreign "g_io_channel_set_line_term" (ptr t_typ @-> string_opt @-> int32_t @-> returning (void))

let shutdown =
foreign "g_io_channel_shutdown" (ptr t_typ @-> bool  @-> ptr_opt (ptr Error.t_typ) @-> returning ((* interface *) IOStatus.t_view))

let unix_get_fd =
foreign "g_io_channel_unix_get_fd" (ptr t_typ @-> returning (int32_t))

let unref =
foreign "g_io_channel_unref" (ptr t_typ @-> returning (void))

let write =
foreign "g_io_channel_write" (ptr t_typ @-> string @-> uint64_t @-> ptr uint64_t @-> returning ((* interface *) IOError.t_view))

(*Not implemented g_io_channel_write_chars argument types not handled*)
(*Not implemented g_io_channel_write_unichar argument types not handled*)
let error_from_errno =
foreign "g_io_channel_error_from_errno" (ptr t_typ @-> int32_t @-> returning ((* interface *) IOChannel_error.t_view))

let error_quark =
foreign "g_io_channel_error_quark" (ptr t_typ @-> returning (uint32_t))


