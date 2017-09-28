open Ctypes
open Foreign

type t = Flag_recursion | Flag_fatal | Level_error | Level_critical | Level_warning | Level_message | Level_info | Level_debug | Level_mask
type t_list = t list
let of_value v =
if v = Int32.of_int 1 then Flag_recursion
else if v = Int32.of_int 2 then Flag_fatal
else if v = Int32.of_int 4 then Level_error
else if v = Int32.of_int 8 then Level_critical
else if v = Int32.of_int 16 then Level_warning
else if v = Int32.of_int 32 then Level_message
else if v = Int32.of_int 64 then Level_info
else if v = Int32.of_int 128 then Level_debug
else if v = Int32.of_int (-4) then Level_mask
else raise (Invalid_argument "Unexpected Log_level_flags value")
let to_value = function
| Flag_recursion -> Int32.of_int 1
| Flag_fatal -> Int32.of_int 2
| Level_error -> Int32.of_int 4
| Level_critical -> Int32.of_int 8
| Level_warning -> Int32.of_int 16
| Level_message -> Int32.of_int 32
| Level_info -> Int32.of_int 64
| Level_debug -> Int32.of_int 128
| Level_mask -> Int32.of_int (-4)
let list_of_value v =
let open Int32 in
let all_flags = [( 1 , Flag_recursion ); ( 2 , Flag_fatal ); ( 4 , Level_error ); ( 8 , Level_critical ); ( 16 , Level_warning ); ( 32 , Level_message ); ( 64 , Level_info ); ( 128 , Level_debug ); ( ( -4 ) , Level_mask )]
in
let rec build_flags_list allf acc =
match allf with
| [] -> acc
| (i, f) :: q -> if ((logand v (of_int i )) <> zero) then build_flags_list q (f :: acc)
else build_flags_list q acc
in build_flags_list all_flags []
let list_to_value flags =
let open Int32 in
let rec logor_flags l acc =
match l with
| [] -> acc
| f :: q -> let v = to_value f in
let acc' = logor acc v in
logor_flags q acc'
in
logor_flags flags zero
let t_list_view = view
~read:list_of_value
~write:list_to_value
int32_t

