open Ctypes
open Foreign

type t = No_conversion | Illegal_sequence | Failed | Partial_input | Bad_uri | Not_absolute_path | No_memory
let of_value v =
if v = Unsigned.UInt32.of_int 0 then No_conversion
else if v = Unsigned.UInt32.of_int 1 then Illegal_sequence
else if v = Unsigned.UInt32.of_int 2 then Failed
else if v = Unsigned.UInt32.of_int 3 then Partial_input
else if v = Unsigned.UInt32.of_int 4 then Bad_uri
else if v = Unsigned.UInt32.of_int 5 then Not_absolute_path
else if v = Unsigned.UInt32.of_int 6 then No_memory
else raise (Invalid_argument "Unexpected Convert_error value")
let to_value = function
| No_conversion -> Unsigned.UInt32.of_int 0
| Illegal_sequence -> Unsigned.UInt32.of_int 1
| Failed -> Unsigned.UInt32.of_int 2
| Partial_input -> Unsigned.UInt32.of_int 3
| Bad_uri -> Unsigned.UInt32.of_int 4
| Not_absolute_path -> Unsigned.UInt32.of_int 5
| No_memory -> Unsigned.UInt32.of_int 6
let t_view = view 
~read:of_value 
~write:to_value 
uint32_t

