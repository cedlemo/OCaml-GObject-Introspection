open Ctypes
open Foreign

type t = Invalid | Method_call | Method_return | Error | Signal

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then Method_call
  else if v = Unsigned.UInt32.of_int 2 then Method_return
  else if v = Unsigned.UInt32.of_int 3 then Error
  else if v = Unsigned.UInt32.of_int 4 then Signal
  else raise (Invalid_argument "Unexpected DBus_message_type value")

let to_value = function
  | Invalid -> Unsigned.UInt32.of_int 0
  | Method_call -> Unsigned.UInt32.of_int 1
  | Method_return -> Unsigned.UInt32.of_int 2
  | Error -> Unsigned.UInt32.of_int 3
  | Signal -> Unsigned.UInt32.of_int 4

let t_view = view ~read:of_value ~write:to_value uint32_t

