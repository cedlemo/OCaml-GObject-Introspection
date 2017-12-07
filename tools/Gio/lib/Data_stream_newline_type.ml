open Ctypes
open Foreign

type t = Lf | Cr | Cr_lf | Any

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Lf
  else if v = Unsigned.UInt32.of_int 1 then Cr
  else if v = Unsigned.UInt32.of_int 2 then Cr_lf
  else if v = Unsigned.UInt32.of_int 3 then Any
  else raise (Invalid_argument "Unexpected Data_stream_newline_type value")

let to_value =  function
  | Lf -> Unsigned.UInt32.of_int 0
  | Cr -> Unsigned.UInt32.of_int 1
  | Cr_lf -> Unsigned.UInt32.of_int 2
  | Any -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t

