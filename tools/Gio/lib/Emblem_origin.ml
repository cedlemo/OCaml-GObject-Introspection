open Ctypes
open Foreign

type t = Unknown | Device | Livemetadata | Tag

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown
  else if v = Unsigned.UInt32.of_int 1 then Device
  else if v = Unsigned.UInt32.of_int 2 then Livemetadata
  else if v = Unsigned.UInt32.of_int 3 then Tag
  else raise (Invalid_argument "Unexpected Emblem_origin value")

let to_value = function
  | Unknown -> Unsigned.UInt32.of_int 0
  | Device -> Unsigned.UInt32.of_int 1
  | Livemetadata -> Unsigned.UInt32.of_int 2
  | Tag -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t

