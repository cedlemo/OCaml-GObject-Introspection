open Ctypes
type t
val iochannel : t structure typ
val ref_count: (int32, t structure) field
val funcs: ( ptr, t structure) field
val encoding: (string ptr, t structure) field
val read_cd: ( ptr, t structure) field
val write_cd: ( ptr, t structure) field
val line_term: (string ptr, t structure) field
val line_term_len: (Unsigned.uint32, t structure) field
val buf_size: (Unsigned.uint64, t structure) field
val read_buf: ( ptr, t structure) field
val encoded_read_buf: ( ptr, t structure) field
val write_buf: ( ptr, t structure) field
val partial_write_buf: (Array.t structure, t structure) field
val use_buffer: (Unsigned.uint32, t structure) field
val do_encode: (Unsigned.uint32, t structure) field
val close_on_unref: (Unsigned.uint32, t structure) field
val is_readable: (Unsigned.uint32, t structure) field
val is_writeable: (Unsigned.uint32, t structure) field
val is_seekable: (Unsigned.uint32, t structure) field
val reserved1: (unit ptr, t structure) field
val reserved2: (unit ptr, t structure) field
