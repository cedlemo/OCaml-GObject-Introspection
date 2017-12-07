open Ctypes
open Foreign

type t = Unknown_option | Bad_value | Failed

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown_option
  else if v = Unsigned.UInt32.of_int 1 then Bad_value
  else if v = Unsigned.UInt32.of_int 2 then Failed
  else raise (Invalid_argument "Unexpected Option_error value")

let to_value = function
  | Unknown_option -> Unsigned.UInt32.of_int 0
  | Bad_value -> Unsigned.UInt32.of_int 1
  | Failed -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

