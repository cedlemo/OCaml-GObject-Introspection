open Ctypes
open Foreign

type t = None | Requested | Required

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Requested
  else if v = Unsigned.UInt32.of_int 2 then Required
  else raise (Invalid_argument "Unexpected Tls_authentication_mode value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Requested -> Unsigned.UInt32.of_int 1
  | Required -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

