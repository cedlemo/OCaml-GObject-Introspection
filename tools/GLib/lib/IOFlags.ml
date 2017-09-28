open Ctypes
open Foreign

type t = Append | Nonblock | Is_readable | Is_writable | Is_writeable | Is_seekable | Mask | Get_mask | Set_mask
type t_list = t list
let of_value v =
if v = Unsigned.UInt32.of_int 1 then Append
else if v = Unsigned.UInt32.of_int 2 then Nonblock
else if v = Unsigned.UInt32.of_int 4 then Is_readable
else if v = Unsigned.UInt32.of_int 8 then Is_writable
else if v = Unsigned.UInt32.of_int 8 then Is_writeable
else if v = Unsigned.UInt32.of_int 16 then Is_seekable
else if v = Unsigned.UInt32.of_int 31 then Mask
else if v = Unsigned.UInt32.of_int 31 then Get_mask
else if v = Unsigned.UInt32.of_int 3 then Set_mask
else raise (Invalid_argument "Unexpected IOFlags value")
let to_value = function
| Append -> Unsigned.UInt32.of_int 1
| Nonblock -> Unsigned.UInt32.of_int 2
| Is_readable -> Unsigned.UInt32.of_int 4
| Is_writable -> Unsigned.UInt32.of_int 8
| Is_writeable -> Unsigned.UInt32.of_int 8
| Is_seekable -> Unsigned.UInt32.of_int 16
| Mask -> Unsigned.UInt32.of_int 31
| Get_mask -> Unsigned.UInt32.of_int 31
| Set_mask -> Unsigned.UInt32.of_int 3
let list_of_value v =
let open Unsigned.UInt32 in
let all_flags = [( 1 , Append ); ( 2 , Nonblock ); ( 4 , Is_readable ); ( 8 , Is_writable ); ( 8 , Is_writeable ); ( 16 , Is_seekable ); ( 31 , Mask ); ( 31 , Get_mask ); ( 3 , Set_mask )]
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

