open Ctypes
open Foreign

type t = Big_endian | Little_endian | Host_endian

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Big_endian
  else if v = Unsigned.UInt32.of_int 1 then Little_endian
  else if v = Unsigned.UInt32.of_int 2 then Host_endian
  else raise (Invalid_argument "Unexpected Data_stream_byte_order value")

let to_value = function
  | Big_endian -> Unsigned.UInt32.of_int 0
  | Little_endian -> Unsigned.UInt32.of_int 1
  | Host_endian -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

