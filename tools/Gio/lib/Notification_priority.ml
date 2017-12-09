open Ctypes
open Foreign

type t = Normal | Low | High | Urgent

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Normal
  else if v = Unsigned.UInt32.of_int 1 then Low
  else if v = Unsigned.UInt32.of_int 2 then High
  else if v = Unsigned.UInt32.of_int 3 then Urgent
  else raise (Invalid_argument "Unexpected Notification_priority value")

let to_value = function
  | Normal -> Unsigned.UInt32.of_int 0
  | Low -> Unsigned.UInt32.of_int 1
  | High -> Unsigned.UInt32.of_int 2
  | Urgent -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t

