open Ctypes
open Foreign

type t = Unknown | Regular | Directory | Symbolic_link | Special | Shortcut | Mountable

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Unknown
  else if v = Unsigned.UInt32.of_int 1 then Regular
  else if v = Unsigned.UInt32.of_int 2 then Directory
  else if v = Unsigned.UInt32.of_int 3 then Symbolic_link
  else if v = Unsigned.UInt32.of_int 4 then Special
  else if v = Unsigned.UInt32.of_int 5 then Shortcut
  else if v = Unsigned.UInt32.of_int 6 then Mountable
  else raise (Invalid_argument "Unexpected File_type value")

let to_value =  function
  | Unknown -> Unsigned.UInt32.of_int 0
  | Regular -> Unsigned.UInt32.of_int 1
  | Directory -> Unsigned.UInt32.of_int 2
  | Symbolic_link -> Unsigned.UInt32.of_int 3
  | Special -> Unsigned.UInt32.of_int 4
  | Shortcut -> Unsigned.UInt32.of_int 5
  | Mountable -> Unsigned.UInt32.of_int 6

let t_view = view ~read:of_value ~write:to_value uint32_t

