open Ctypes
open Foreign

type t = Error | Converted | Finished | Flushed

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Error
  else if v = Unsigned.UInt32.of_int 1 then Converted
  else if v = Unsigned.UInt32.of_int 2 then Finished
  else if v = Unsigned.UInt32.of_int 3 then Flushed
  else raise (Invalid_argument "Unexpected Converter_result value")

let to_value =  function
  | Error -> Unsigned.UInt32.of_int 0
  | Converted -> Unsigned.UInt32.of_int 1
  | Finished -> Unsigned.UInt32.of_int 2
  | Flushed -> Unsigned.UInt32.of_int 3

let t_view = view ~read:of_value ~write:to_value uint32_t

