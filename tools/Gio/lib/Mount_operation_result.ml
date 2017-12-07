open Ctypes
open Foreign

type t = Handled | Aborted | Unhandled

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Handled
  else if v = Unsigned.UInt32.of_int 1 then Aborted
  else if v = Unsigned.UInt32.of_int 2 then Unhandled
  else raise (Invalid_argument "Unexpected Mount_operation_result value")

let to_value =  function
  | Handled -> Unsigned.UInt32.of_int 0
  | Aborted -> Unsigned.UInt32.of_int 1
  | Unhandled -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

