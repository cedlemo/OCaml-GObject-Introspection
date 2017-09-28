open Ctypes
open Foreign

type t = Error | Normal | Eof | Again
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Error
else if v = Unsigned.UInt32.of_int 1 then Normal
else if v = Unsigned.UInt32.of_int 2 then Eof
else if v = Unsigned.UInt32.of_int 3 then Again
else raise (Invalid_argument "Unexpected IOStatus value")
let to_value = function
| Error -> Unsigned.UInt32.of_int 0
| Normal -> Unsigned.UInt32.of_int 1
| Eof -> Unsigned.UInt32.of_int 2
| Again -> Unsigned.UInt32.of_int 3
let t_view = view
~read:of_value
~write:to_value
uint32_t

