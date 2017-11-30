open Ctypes
open Foreign

type t = None | Again | Inval | Unknown

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Again
  else if v = Unsigned.UInt32.of_int 2 then Inval
  else if v = Unsigned.UInt32.of_int 3 then Unknown
  else raise (Invalid_argument "Unexpected IOError value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Again -> Unsigned.UInt32.of_int 1
  | Inval -> Unsigned.UInt32.of_int 2
  | Unknown -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t

