open Ctypes
open Foreign

type t = Standard | Daylight | Universal

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Standard
  else if v = Unsigned.UInt32.of_int 1 then Daylight
  else if v = Unsigned.UInt32.of_int 2 then Universal
  else raise (Invalid_argument "Unexpected Time_type value")

let to_value =  function
  | Standard -> Unsigned.UInt32.of_int 0
  | Daylight -> Unsigned.UInt32.of_int 1
  | Universal -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

