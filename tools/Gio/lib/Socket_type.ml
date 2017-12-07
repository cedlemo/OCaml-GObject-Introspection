open Ctypes
open Foreign

type t = Invalid | Stream | Datagram | Seqpacket

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then Stream
  else if v = Unsigned.UInt32.of_int 2 then Datagram
  else if v = Unsigned.UInt32.of_int 3 then Seqpacket
  else raise (Invalid_argument "Unexpected Socket_type value")

let to_value =  function
  | Invalid -> Unsigned.UInt32.of_int 0
  | Stream -> Unsigned.UInt32.of_int 1
  | Datagram -> Unsigned.UInt32.of_int 2
  | Seqpacket -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t

