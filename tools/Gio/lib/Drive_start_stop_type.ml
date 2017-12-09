open Ctypes
open Foreign

type t = Unknown | Shutdown | Network | Multidisk | Password

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown
  else if v = Unsigned.UInt32.of_int 1 then Shutdown
  else if v = Unsigned.UInt32.of_int 2 then Network
  else if v = Unsigned.UInt32.of_int 3 then Multidisk
  else if v = Unsigned.UInt32.of_int 4 then Password
  else raise (Invalid_argument "Unexpected Drive_start_stop_type value")

let to_value = function
  | Unknown -> Unsigned.UInt32.of_int 0
  | Shutdown -> Unsigned.UInt32.of_int 1
  | Network -> Unsigned.UInt32.of_int 2
  | Multidisk -> Unsigned.UInt32.of_int 3
  | Password -> Unsigned.UInt32.of_int 4

let t_view = view ~read:of_value ~write:to_value uint32_t

