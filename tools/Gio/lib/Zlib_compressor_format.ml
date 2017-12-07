open Ctypes
open Foreign

type t = Zlib | Gzip | Raw

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Zlib
  else if v = Unsigned.UInt32.of_int 1 then Gzip
  else if v = Unsigned.UInt32.of_int 2 then Raw
  else raise (Invalid_argument "Unexpected Zlib_compressor_format value")

let to_value =  function
  | Zlib -> Unsigned.UInt32.of_int 0
  | Gzip -> Unsigned.UInt32.of_int 1
  | Raw -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

