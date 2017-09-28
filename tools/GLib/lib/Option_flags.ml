open Ctypes
open Foreign

type t = None | Hidden | In_main | Reverse | No_arg | Filename | Optional_arg | Noalias
type t_list = t list
let of_value v =
if v = Unsigned.UInt32.of_int 0 then None
else if v = Unsigned.UInt32.of_int 1 then Hidden
else if v = Unsigned.UInt32.of_int 2 then In_main
else if v = Unsigned.UInt32.of_int 4 then Reverse
else if v = Unsigned.UInt32.of_int 8 then No_arg
else if v = Unsigned.UInt32.of_int 16 then Filename
else if v = Unsigned.UInt32.of_int 32 then Optional_arg
else if v = Unsigned.UInt32.of_int 64 then Noalias
else raise (Invalid_argument "Unexpected Option_flags value")
let to_value = function
| None -> Unsigned.UInt32.of_int 0
| Hidden -> Unsigned.UInt32.of_int 1
| In_main -> Unsigned.UInt32.of_int 2
| Reverse -> Unsigned.UInt32.of_int 4
| No_arg -> Unsigned.UInt32.of_int 8
| Filename -> Unsigned.UInt32.of_int 16
| Optional_arg -> Unsigned.UInt32.of_int 32
| Noalias -> Unsigned.UInt32.of_int 64
let list_of_value v =
let open Unsigned.UInt32 in
let all_flags = [( 0 , None ); ( 1 , Hidden ); ( 2 , In_main ); ( 4 , Reverse ); ( 8 , No_arg ); ( 16 , Filename ); ( 32 , Optional_arg ); ( 64 , Noalias )]
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

