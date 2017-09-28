open Ctypes
open Foreign

type t = Cur | Set | End
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Cur
else if v = Unsigned.UInt32.of_int 1 then Set
else if v = Unsigned.UInt32.of_int 2 then End
else raise (Invalid_argument "Unexpected Seek_type value")
let to_value = function
| Cur -> Unsigned.UInt32.of_int 0
| Set -> Unsigned.UInt32.of_int 1
| End -> Unsigned.UInt32.of_int 2
let t_view = view
~read:of_value
~write:to_value
uint32_t

