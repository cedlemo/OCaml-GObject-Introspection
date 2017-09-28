open Ctypes
open Foreign

type t = Bad_quoting | Empty_string | Failed
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Bad_quoting
else if v = Unsigned.UInt32.of_int 1 then Empty_string
else if v = Unsigned.UInt32.of_int 2 then Failed
else raise (Invalid_argument "Unexpected Shell_error value")
let to_value = function
| Bad_quoting -> Unsigned.UInt32.of_int 0
| Empty_string -> Unsigned.UInt32.of_int 1
| Failed -> Unsigned.UInt32.of_int 2
let t_view = view
~read:of_value
~write:to_value
uint32_t

