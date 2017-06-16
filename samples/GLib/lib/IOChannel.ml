open Ctypes
open Foreign
type t
let t_typ : t structure typ = structure "IOChannel"
let f_ref_count = field t_typ "ref_count" (int32_t)
let f_funcs = field t_typ "funcs" (ptr )
let f_encoding = field t_typ "encoding" (ptr string)
let f_read_cd = field t_typ "read_cd" (ptr )
let f_write_cd = field t_typ "write_cd" (ptr )
let f_line_term = field t_typ "line_term" (ptr string)
let f_line_term_len = field t_typ "line_term_len" (uint32_t)
let f_buf_size = field t_typ "buf_size" (uint64_t)
let f_read_buf = field t_typ "read_buf" (ptr )
let f_encoded_read_buf = field t_typ "encoded_read_buf" (ptr )
let f_write_buf = field t_typ "write_buf" (ptr )
let f_partial_write_buf = field t_typ "partial_write_buf" (Array.t_typ)
let f_use_buffer = field t_typ "use_buffer" (uint32_t)
let f_do_encode = field t_typ "do_encode" (uint32_t)
let f_close_on_unref = field t_typ "close_on_unref" (uint32_t)
let f_is_readable = field t_typ "is_readable" (uint32_t)
let f_is_writeable = field t_typ "is_writeable" (uint32_t)
let f_is_seekable = field t_typ "is_seekable" (uint32_t)
let f_reserved1 = field t_typ "reserved1" (ptr void)
let f_reserved2 = field t_typ "reserved2" (ptr void)
