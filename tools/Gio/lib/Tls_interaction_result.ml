open Ctypes
open Foreign

type t = Unhandled | Handled | Failed

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unhandled
  else if v = Unsigned.UInt32.of_int 1 then Handled
  else if v = Unsigned.UInt32.of_int 2 then Failed
  else raise (Invalid_argument "Unexpected Tls_interaction_result value")

let to_value =  function
  | Unhandled -> Unsigned.UInt32.of_int 0
  | Handled -> Unsigned.UInt32.of_int 1
  | Failed -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

