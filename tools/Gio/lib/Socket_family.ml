open Ctypes
open Foreign

type t = Invalid | Unix | Ipv4 | Ipv6

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then Unix
  else if v = Unsigned.UInt32.of_int 2 then Ipv4
  else if v = Unsigned.UInt32.of_int 10 then Ipv6
  else raise (Invalid_argument "Unexpected Socket_family value")

let to_value = function
  | Invalid -> Unsigned.UInt32.of_int 0
  | Unix -> Unsigned.UInt32.of_int 1
  | Ipv4 -> Unsigned.UInt32.of_int 2
  | Ipv6 -> Unsigned.UInt32.of_int 10

let t_view = view ~read:of_value ~write:to_value uint32_t

