open Ctypes
open Foreign

type t = Is_regular | Is_symlink | Is_dir | Is_executable | Exists
type t_list = t list
let of_value v =
if v = Unsigned.UInt32.of_int 1 then Is_regular
else if v = Unsigned.UInt32.of_int 2 then Is_symlink
else if v = Unsigned.UInt32.of_int 4 then Is_dir
else if v = Unsigned.UInt32.of_int 8 then Is_executable
else if v = Unsigned.UInt32.of_int 16 then Exists
else raise (Invalid_argument "Unexpected File_test value")
let to_value = function
| Is_regular -> Unsigned.UInt32.of_int 1
| Is_symlink -> Unsigned.UInt32.of_int 2
| Is_dir -> Unsigned.UInt32.of_int 4
| Is_executable -> Unsigned.UInt32.of_int 8
| Exists -> Unsigned.UInt32.of_int 16
let list_of_value v =
let open Unsigned.UInt32 in
let all_flags = [( 1 , Is_regular ); ( 2 , Is_symlink ); ( 4 , Is_dir ); ( 8 , Is_executable ); ( 16 , Exists )]
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

