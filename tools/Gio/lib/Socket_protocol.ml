open Ctypes
open Foreign

type t = Unknown | Default | Tcp | Udp | Sctp

let of_value v =
  if v = Int32.of_int (-1) then Unknown
  else if v = Int32.of_int 0 then Default
  else if v = Int32.of_int 6 then Tcp
  else if v = Int32.of_int 17 then Udp
  else if v = Int32.of_int 132 then Sctp
  else raise (Invalid_argument "Unexpected Socket_protocol value")

let to_value =  function
  | Unknown -> Int32.of_int (-1)
  | Default -> Int32.of_int 0
  | Tcp -> Int32.of_int 6
  | Udp -> Int32.of_int 17
  | Sctp -> Int32.of_int 132

let t_view = view ~read:of_value ~write:to_value int32_t

