open Ctypes
open Foreign

type t = In_order | Pre_order | Post_order | Level_order
let of_value v =
if v = Unsigned.UInt32.of_int 0 then In_order
else if v = Unsigned.UInt32.of_int 1 then Pre_order
else if v = Unsigned.UInt32.of_int 2 then Post_order
else if v = Unsigned.UInt32.of_int 3 then Level_order
else raise (Invalid_argument "Unexpected Traverse_type value")
let to_value = function
| In_order -> Unsigned.UInt32.of_int 0
| Pre_order -> Unsigned.UInt32.of_int 1
| Post_order -> Unsigned.UInt32.of_int 2
| Level_order -> Unsigned.UInt32.of_int 3
let t_view = view 
~read:of_value 
~write:to_value 
uint32_t

