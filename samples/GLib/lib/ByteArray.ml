open Ctypes
open Foreign
type t
let bytearray : t structure typ = structure "ByteArray"
let data = field bytearray "data" (ptr uint8_t)
let len = field bytearray "len" (uint32_t)
let _ = seal bytearray
