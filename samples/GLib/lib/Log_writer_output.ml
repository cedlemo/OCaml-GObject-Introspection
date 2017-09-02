open Ctypes
open Foreign

type t = Handled | Unhandled
let of_value v =
if v = Unsigned.UInt32.of_int 1 then Handled
else if v = Unsigned.UInt32.of_int 0 then Unhandled
else raise (Invalid_argument "Unexpected Log_writer_output value")
let to_value = function
| Handled -> Unsigned.UInt32.of_int 1
| Unhandled -> Unsigned.UInt32.of_int 0
let t_view = view 
~read:of_value 
~write:to_value 
uint32_t

