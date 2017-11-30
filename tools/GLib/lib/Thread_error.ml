open Ctypes
open Foreign

type t = Thread_error_again

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Thread_error_again
  else raise (Invalid_argument "Unexpected Thread_error value")

let to_value =  function
  | Thread_error_again -> Unsigned.UInt32.of_int 0

let t_view = view ~read:of_value ~write:to_value uint32_t

