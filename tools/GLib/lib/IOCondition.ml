open Ctypes
open Foreign

type t = In | Out | Pri | Err | Hup | Nval
type t_list = t list
let of_value v =
if v = Unsigned.UInt32.of_int 1 then In
else if v = Unsigned.UInt32.of_int 4 then Out
else if v = Unsigned.UInt32.of_int 2 then Pri
else if v = Unsigned.UInt32.of_int 8 then Err
else if v = Unsigned.UInt32.of_int 16 then Hup
else if v = Unsigned.UInt32.of_int 32 then Nval
else raise (Invalid_argument "Unexpected IOCondition value")
let to_value = function
| In -> Unsigned.UInt32.of_int 1
| Out -> Unsigned.UInt32.of_int 4
| Pri -> Unsigned.UInt32.of_int 2
| Err -> Unsigned.UInt32.of_int 8
| Hup -> Unsigned.UInt32.of_int 16
| Nval -> Unsigned.UInt32.of_int 32
let list_of_value v =
let open Unsigned.UInt32 in
let all_flags = [( 1 , In ); ( 4 , Out ); ( 2 , Pri ); ( 8 , Err ); ( 16 , Hup ); ( 32 , Nval )]
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

