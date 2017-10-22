open Ctypes

type t
val t_typ : t structure typ
val f_ref_count: (int32, t structure) field
val f_funcs: (IOFuncs.t structure ptr, t structure) field
val f_encoding: (string, t structure) field
val f_read_cd: (IConv.t structure ptr, t structure) field
val f_write_cd: (IConv.t structure ptr, t structure) field
val f_line_term: (string, t structure) field
val f_line_term_len: (Unsigned.uint32, t structure) field
val f_buf_size: (Unsigned.uint64, t structure) field
val f_read_buf: (String.t structure ptr, t structure) field
val f_encoded_read_buf: (String.t structure ptr, t structure) field
val f_write_buf: (String.t structure ptr, t structure) field
(*Struct field IOChannel : C Array type for Types.Array tag tag not implemented*)
val f_use_buffer: (Unsigned.uint32, t structure) field
val f_do_encode: (Unsigned.uint32, t structure) field
val f_close_on_unref: (Unsigned.uint32, t structure) field
val f_is_readable: (Unsigned.uint32, t structure) field
val f_is_writeable: (Unsigned.uint32, t structure) field
val f_is_seekable: (Unsigned.uint32, t structure) field
val f_reserved1: (unit ptr, t structure) field
val f_reserved2: (unit ptr, t structure) field
val new_file:
  t structure ptr -> string -> string -> Error.t structure ptr ptr option -> t structure ptr

val unix_new:
  t structure ptr -> int32 -> t structure ptr

val close:
  t structure ptr -> unit

val flush:
  t structure ptr -> Error.t structure ptr ptr option -> IOStatus.t

val get_buffer_condition:
  t structure ptr -> IOCondition.t_list

val get_buffer_size:
  t structure ptr -> Unsigned.uint64

val get_buffered:
  t structure ptr -> bool

val get_close_on_unref:
  t structure ptr -> bool

val get_encoding:
  t structure ptr -> string

val get_flags:
  t structure ptr -> IOFlags.t_list

val get_line_term:
  t structure ptr -> int32 ptr -> string

val init:
  t structure ptr -> unit

val read:
  t structure ptr -> string -> Unsigned.uint64 -> Unsigned.uint64 ptr -> IOError.t

(*Not implemented g_io_channel_read_chars argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_io_channel_read_line argument typeArg_info.InOut or Arg_info.Out not handled*)
val read_line_string:
  t structure ptr -> String.t structure ptr -> Unsigned.uint64 ptr option -> Error.t structure ptr ptr option -> IOStatus.t

(*Not implemented g_io_channel_read_to_end argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_io_channel_read_unichar argument typeArg_info.InOut or Arg_info.Out not handled*)
val ref:
  t structure ptr -> t structure ptr

val seek:
  t structure ptr -> int64 -> Seek_type.t -> IOError.t

val seek_position:
  t structure ptr -> int64 -> Seek_type.t -> Error.t structure ptr ptr option -> IOStatus.t

val set_buffer_size:
  t structure ptr -> Unsigned.uint64 -> unit

val set_buffered:
  t structure ptr -> bool -> unit

val set_close_on_unref:
  t structure ptr -> bool -> unit

val set_encoding:
  t structure ptr -> string option -> Error.t structure ptr ptr option -> IOStatus.t

val set_flags:
  t structure ptr -> IOFlags.t_list -> Error.t structure ptr ptr option -> IOStatus.t

val set_line_term:
  t structure ptr -> string option -> int32 -> unit

val shutdown:
  t structure ptr -> bool -> Error.t structure ptr ptr option -> IOStatus.t

val unix_get_fd:
  t structure ptr -> int32

val unref:
  t structure ptr -> unit

val write:
  t structure ptr -> string -> Unsigned.uint64 -> Unsigned.uint64 ptr -> IOError.t

(*Not implemented g_io_channel_write_chars argument typeC Array type for Types.Array tag not handled*)
(*Not implemented g_io_channel_write_unichar argument typeunichar not handled*)
val error_from_errno:
  t structure ptr -> int32 -> IOChannel_error.t

val error_quark:
  t structure ptr -> Unsigned.uint32


