open Ctypes
open Foreign

type t = Binding | Bound | Listening | Listened

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Binding
  else if v = Unsigned.UInt32.of_int 1 then Bound
  else if v = Unsigned.UInt32.of_int 2 then Listening
  else if v = Unsigned.UInt32.of_int 3 then Listened
  else raise (Invalid_argument "Unexpected Socket_listener_event value")

let to_value = function
  | Binding -> Unsigned.UInt32.of_int 0
  | Bound -> Unsigned.UInt32.of_int 1
  | Listening -> Unsigned.UInt32.of_int 2
  | Listened -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t

