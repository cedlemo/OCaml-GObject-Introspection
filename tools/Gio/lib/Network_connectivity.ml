open Ctypes
open Foreign

type t = Local | Limited | Portal | Full

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Local
  else if v = Unsigned.UInt32.of_int 2 then Limited
  else if v = Unsigned.UInt32.of_int 3 then Portal
  else if v = Unsigned.UInt32.of_int 4 then Full
  else raise (Invalid_argument "Unexpected Network_connectivity value")

let to_value = function
  | Local -> Unsigned.UInt32.of_int 1
  | Limited -> Unsigned.UInt32.of_int 2
  | Portal -> Unsigned.UInt32.of_int 3
  | Full -> Unsigned.UInt32.of_int 4

let t_view = view ~read:of_value ~write:to_value uint32_t

