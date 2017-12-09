open Ctypes
open Foreign

type t = Never | Safely | Unsafely

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Never
  else if v = Unsigned.UInt32.of_int 1 then Safely
  else if v = Unsigned.UInt32.of_int 2 then Unsafely
  else raise (Invalid_argument "Unexpected Tls_rehandshake_mode value")

let to_value = function
  | Never -> Unsigned.UInt32.of_int 0
  | Safely -> Unsigned.UInt32.of_int 1
  | Unsafely -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

