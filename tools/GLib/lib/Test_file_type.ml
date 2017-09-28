open Ctypes
open Foreign

type t = Dist | Built
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Dist
else if v = Unsigned.UInt32.of_int 1 then Built
else raise (Invalid_argument "Unexpected Test_file_type value")
let to_value = function
| Dist -> Unsigned.UInt32.of_int 0
| Built -> Unsigned.UInt32.of_int 1
let t_view = view
~read:of_value
~write:to_value
uint32_t

