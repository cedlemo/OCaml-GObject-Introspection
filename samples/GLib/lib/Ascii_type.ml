open Ctypes
open Foreign

type t = Alnum | Alpha | Cntrl | Digit | Graph | Lower | Print | Punct | Space | Upper | Xdigit
type t_list = t list
let of_value v =
if v = Unsigned.UInt32.of_int 1 then Alnum
else if v = Unsigned.UInt32.of_int 2 then Alpha
else if v = Unsigned.UInt32.of_int 4 then Cntrl
else if v = Unsigned.UInt32.of_int 8 then Digit
else if v = Unsigned.UInt32.of_int 16 then Graph
else if v = Unsigned.UInt32.of_int 32 then Lower
else if v = Unsigned.UInt32.of_int 64 then Print
else if v = Unsigned.UInt32.of_int 128 then Punct
else if v = Unsigned.UInt32.of_int 256 then Space
else if v = Unsigned.UInt32.of_int 512 then Upper
else if v = Unsigned.UInt32.of_int 1024 then Xdigit
else raise (Invalid_argument "Unexpected Ascii_type value")
let to_value = function
| Alnum -> Unsigned.UInt32.of_int 1
| Alpha -> Unsigned.UInt32.of_int 2
| Cntrl -> Unsigned.UInt32.of_int 4
| Digit -> Unsigned.UInt32.of_int 8
| Graph -> Unsigned.UInt32.of_int 16
| Lower -> Unsigned.UInt32.of_int 32
| Print -> Unsigned.UInt32.of_int 64
| Punct -> Unsigned.UInt32.of_int 128
| Space -> Unsigned.UInt32.of_int 256
| Upper -> Unsigned.UInt32.of_int 512
| Xdigit -> Unsigned.UInt32.of_int 1024
let list_of_value v =
let open Unsigned.UInt32 in
let all_flags = [( 1 , Alnum ); ( 2 , Alpha ); ( 4 , Cntrl ); ( 8 , Digit ); ( 16 , Graph ); ( 32 , Lower ); ( 64 , Print ); ( 128 , Punct ); ( 256 , Space ); ( 512 , Upper ); ( 1024 , Xdigit )]
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

