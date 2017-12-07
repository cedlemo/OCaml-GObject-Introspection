open Ctypes
open Foreign

type t = Unset | Set | Error_setting

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unset
  else if v = Unsigned.UInt32.of_int 1 then Set
  else if v = Unsigned.UInt32.of_int 2 then Error_setting
  else raise (Invalid_argument "Unexpected File_attribute_status value")

let to_value =  function
  | Unset -> Unsigned.UInt32.of_int 0
  | Set -> Unsigned.UInt32.of_int 1
  | Error_setting -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

