open Ctypes
open Foreign

type t = Not_found | Temporary_failure | Internal

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Not_found
  else if v = Unsigned.UInt32.of_int 1 then Temporary_failure
  else if v = Unsigned.UInt32.of_int 2 then Internal
  else raise (Invalid_argument "Unexpected Resolver_error value")

let to_value = function
  | Not_found -> Unsigned.UInt32.of_int 0
  | Temporary_failure -> Unsigned.UInt32.of_int 1
  | Internal -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

