open Ctypes
open Foreign

type t = Big_endian | Little_endian

let of_value v =
  if v = Unsigned.UInt32.of_int 66 then Big_endian
  else if v = Unsigned.UInt32.of_int 108 then Little_endian
  else raise (Invalid_argument "Unexpected DBus_message_byte_order value")

let to_value = function
  | Big_endian -> Unsigned.UInt32.of_int 66
  | Little_endian -> Unsigned.UInt32.of_int 108

let t_view = view ~read:of_value ~write:to_value uint32_t

