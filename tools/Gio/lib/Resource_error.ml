open Ctypes
open Foreign

type t = Not_found | Internal

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Not_found
  else if v = Unsigned.UInt32.of_int 1 then Internal
  else raise (Invalid_argument "Unexpected Resource_error value")

let to_value =  function
  | Not_found -> Unsigned.UInt32.of_int 0
  | Internal -> Unsigned.UInt32.of_int 1

let t_view = view ~read:of_value ~write:to_value uint32_t

