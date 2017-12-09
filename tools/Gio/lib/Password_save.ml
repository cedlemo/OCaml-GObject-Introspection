open Ctypes
open Foreign

type t = Never | For_session | Permanently

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Never
  else if v = Unsigned.UInt32.of_int 1 then For_session
  else if v = Unsigned.UInt32.of_int 2 then Permanently
  else raise (Invalid_argument "Unexpected Password_save value")

let to_value = function
  | Never -> Unsigned.UInt32.of_int 0
  | For_session -> Unsigned.UInt32.of_int 1
  | Permanently -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

