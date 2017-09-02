open Ctypes
open Foreign

type t = Active | In_call | Mask
type t_list = t list
let of_value v =
if v = Unsigned.UInt32.of_int 1 then Active
else if v = Unsigned.UInt32.of_int 2 then In_call
else if v = Unsigned.UInt32.of_int 15 then Mask
else raise (Invalid_argument "Unexpected Hook_flag_mask value")
let to_value = function
| Active -> Unsigned.UInt32.of_int 1
| In_call -> Unsigned.UInt32.of_int 2
| Mask -> Unsigned.UInt32.of_int 15
let list_of_value v =
let open Unsigned.UInt32 in
let all_flags = [( 1 , Active ); ( 2 , In_call ); ( 15 , Mask )]
in
let rec build_flags_list allf acc =
match allf with
| [] -> acc
| (i, f) :: q -> if ((logand v (of_int i )) <> zero) then build_flags_list q (f :: acc)
else build_flags_list q acc
in build_flags_list all_flags []
let list_to_value flags =
let open Unsigned.UInt32 in
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
uint32_t

