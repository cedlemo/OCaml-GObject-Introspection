open Ctypes
open Foreign

type t = Day | Month | Year

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Day
  else if v = Unsigned.UInt32.of_int 1 then Month
  else if v = Unsigned.UInt32.of_int 2 then Year
  else raise (Invalid_argument "Unexpected Date_dmy value")

let to_value =  function
  | Day -> Unsigned.UInt32.of_int 0
  | Month -> Unsigned.UInt32.of_int 1
  | Year -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

