open Ctypes
open Foreign

type t = Default | Long_format | Iec_units
type t_list = t list
let of_value v =
if v = Unsigned.UInt32.of_int 0 then Default
else if v = Unsigned.UInt32.of_int 1 then Long_format
else if v = Unsigned.UInt32.of_int 2 then Iec_units
else raise (Invalid_argument "Unexpected Format_size_flags value")
let to_value = function
| Default -> Unsigned.UInt32.of_int 0
| Long_format -> Unsigned.UInt32.of_int 1
| Iec_units -> Unsigned.UInt32.of_int 2
let list_of_value v =
let open Unsigned.UInt32 in
let all_flags = [( 0 , Default ); ( 1 , Long_format ); ( 2 , Iec_units )]
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

