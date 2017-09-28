open Ctypes
open Foreign

type t = Bad_weekday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Bad_weekday
else if v = Unsigned.UInt32.of_int 1 then Monday
else if v = Unsigned.UInt32.of_int 2 then Tuesday
else if v = Unsigned.UInt32.of_int 3 then Wednesday
else if v = Unsigned.UInt32.of_int 4 then Thursday
else if v = Unsigned.UInt32.of_int 5 then Friday
else if v = Unsigned.UInt32.of_int 6 then Saturday
else if v = Unsigned.UInt32.of_int 7 then Sunday
else raise (Invalid_argument "Unexpected Date_weekday value")
let to_value = function
| Bad_weekday -> Unsigned.UInt32.of_int 0
| Monday -> Unsigned.UInt32.of_int 1
| Tuesday -> Unsigned.UInt32.of_int 2
| Wednesday -> Unsigned.UInt32.of_int 3
| Thursday -> Unsigned.UInt32.of_int 4
| Friday -> Unsigned.UInt32.of_int 5
| Saturday -> Unsigned.UInt32.of_int 6
| Sunday -> Unsigned.UInt32.of_int 7
let t_view = view
~read:of_value
~write:to_value
uint32_t

