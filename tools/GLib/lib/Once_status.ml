open Ctypes
open Foreign

type t = Notcalled | Progress | Ready

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Notcalled
  else if v = Unsigned.UInt32.of_int 1 then Progress
  else if v = Unsigned.UInt32.of_int 2 then Ready
  else raise (Invalid_argument "Unexpected Once_status value")

let to_value =  function
  | Notcalled -> Unsigned.UInt32.of_int 0
  | Progress -> Unsigned.UInt32.of_int 1
  | Ready -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

