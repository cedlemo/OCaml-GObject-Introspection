open Ctypes
open Foreign
type t
let iochannel : t structure typ = structure "IOChannel"
let ref_count = field iochannel "ref_count" (int32_t)
let funcs = field iochannel "funcs" (ptr )
let encoding = field iochannel "encoding" (ptr string)
let read_cd = field iochannel "read_cd" (ptr )
let write_cd = field iochannel "write_cd" (ptr )
let line_term = field iochannel "line_term" (ptr string)
let line_term_len = field iochannel "line_term_len" (uint32_t)
let buf_size = field iochannel "buf_size" (uint64_t)
let read_buf = field iochannel "read_buf" (ptr )
let encoded_read_buf = field iochannel "encoded_read_buf" (ptr )
let write_buf = field iochannel "write_buf" (ptr )
let partial_write_buf = field iochannel "partial_write_buf" (Array.array)
let use_buffer = field iochannel "use_buffer" (uint32_t)
let do_encode = field iochannel "do_encode" (uint32_t)
let close_on_unref = field iochannel "close_on_unref" (uint32_t)
let is_readable = field iochannel "is_readable" (uint32_t)
let is_writeable = field iochannel "is_writeable" (uint32_t)
let is_seekable = field iochannel "is_seekable" (uint32_t)
let reserved1 = field iochannel "reserved1" (ptr void)
let reserved2 = field iochannel "reserved2" (ptr void)
let _ = seal iochannel
