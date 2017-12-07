open Ctypes
open Foreign

type t = If_always | If_local | Never

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then If_always
  else if v = Unsigned.UInt32.of_int 1 then If_local
  else if v = Unsigned.UInt32.of_int 2 then Never
  else raise (Invalid_argument "Unexpected Filesystem_preview_type value")

let to_value =  function
  | If_always -> Unsigned.UInt32.of_int 0
  | If_local -> Unsigned.UInt32.of_int 1
  | Never -> Unsigned.UInt32.of_int 2

let t_view = view ~read:of_value ~write:to_value uint32_t

