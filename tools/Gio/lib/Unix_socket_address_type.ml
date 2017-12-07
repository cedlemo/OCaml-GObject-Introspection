open Ctypes
open Foreign

type t = Invalid | Anonymous | Path | Abstract | Abstract_padded

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then Anonymous
  else if v = Unsigned.UInt32.of_int 2 then Path
  else if v = Unsigned.UInt32.of_int 3 then Abstract
  else if v = Unsigned.UInt32.of_int 4 then Abstract_padded
  else raise (Invalid_argument "Unexpected Unix_socket_address_type value")

let to_value =  function
  | Invalid -> Unsigned.UInt32.of_int 0
  | Anonymous -> Unsigned.UInt32.of_int 1
  | Path -> Unsigned.UInt32.of_int 2
  | Abstract -> Unsigned.UInt32.of_int 3
  | Abstract_padded -> Unsigned.UInt32.of_int 4

let t_view = view ~read:of_value ~write:to_value uint32_t

