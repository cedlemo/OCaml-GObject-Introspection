open Ctypes
open Foreign

type t = Bad_month | January | February | March | April | May | June | July | August | September | October | November | December
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Bad_month
else if v = Unsigned.UInt32.of_int 1 then January
else if v = Unsigned.UInt32.of_int 2 then February
else if v = Unsigned.UInt32.of_int 3 then March
else if v = Unsigned.UInt32.of_int 4 then April
else if v = Unsigned.UInt32.of_int 5 then May
else if v = Unsigned.UInt32.of_int 6 then June
else if v = Unsigned.UInt32.of_int 7 then July
else if v = Unsigned.UInt32.of_int 8 then August
else if v = Unsigned.UInt32.of_int 9 then September
else if v = Unsigned.UInt32.of_int 10 then October
else if v = Unsigned.UInt32.of_int 11 then November
else if v = Unsigned.UInt32.of_int 12 then December
else raise (Invalid_argument "Unexpected Date_month value")
let to_value = function
| Bad_month -> Unsigned.UInt32.of_int 0
| January -> Unsigned.UInt32.of_int 1
| February -> Unsigned.UInt32.of_int 2
| March -> Unsigned.UInt32.of_int 3
| April -> Unsigned.UInt32.of_int 4
| May -> Unsigned.UInt32.of_int 5
| June -> Unsigned.UInt32.of_int 6
| July -> Unsigned.UInt32.of_int 7
| August -> Unsigned.UInt32.of_int 8
| September -> Unsigned.UInt32.of_int 9
| October -> Unsigned.UInt32.of_int 10
| November -> Unsigned.UInt32.of_int 11
| December -> Unsigned.UInt32.of_int 12
let t_view = view
~read:of_value
~write:to_value
uint32_t

