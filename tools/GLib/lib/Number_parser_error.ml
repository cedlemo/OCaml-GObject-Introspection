open Ctypes
open Foreign

type t = Invalid | Out_of_bounds

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then Out_of_bounds
  else raise (Invalid_argument "Unexpected Number_parser_error value")

let to_value = function
  | Invalid -> Unsigned.UInt32.of_int 0
  | Out_of_bounds -> Unsigned.UInt32.of_int 1

let t_view = view ~read:of_value ~write:to_value uint32_t

