open Ctypes
open Foreign

type t = None | Error | Start_binary | List_case | Skip_case | Start_case | Stop_case | Min_result | Max_result | Message | Start_suite | Stop_suite
let of_value v =
if v = Unsigned.UInt32.of_int 0 then None
else if v = Unsigned.UInt32.of_int 1 then Error
else if v = Unsigned.UInt32.of_int 2 then Start_binary
else if v = Unsigned.UInt32.of_int 3 then List_case
else if v = Unsigned.UInt32.of_int 4 then Skip_case
else if v = Unsigned.UInt32.of_int 5 then Start_case
else if v = Unsigned.UInt32.of_int 6 then Stop_case
else if v = Unsigned.UInt32.of_int 7 then Min_result
else if v = Unsigned.UInt32.of_int 8 then Max_result
else if v = Unsigned.UInt32.of_int 9 then Message
else if v = Unsigned.UInt32.of_int 10 then Start_suite
else if v = Unsigned.UInt32.of_int 11 then Stop_suite
else raise (Invalid_argument "Unexpected Test_log_type value")
let to_value = function
| None -> Unsigned.UInt32.of_int 0
| Error -> Unsigned.UInt32.of_int 1
| Start_binary -> Unsigned.UInt32.of_int 2
| List_case -> Unsigned.UInt32.of_int 3
| Skip_case -> Unsigned.UInt32.of_int 4
| Start_case -> Unsigned.UInt32.of_int 5
| Stop_case -> Unsigned.UInt32.of_int 6
| Min_result -> Unsigned.UInt32.of_int 7
| Max_result -> Unsigned.UInt32.of_int 8
| Message -> Unsigned.UInt32.of_int 9
| Start_suite -> Unsigned.UInt32.of_int 10
| Stop_suite -> Unsigned.UInt32.of_int 11
let t_view = view
~read:of_value
~write:to_value
uint32_t

