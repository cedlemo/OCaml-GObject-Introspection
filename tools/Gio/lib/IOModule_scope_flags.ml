open Ctypes
open Foreign

type t = None | Block_duplicates

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Block_duplicates
  else raise (Invalid_argument "Unexpected IOModule_scope_flags value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Block_duplicates -> Unsigned.UInt32.of_int 1

let t_view = view ~read:of_value ~write:to_value uint32_t

