open Ctypes
open Foreign

type t = None | Close_stream1 | Close_stream2 | Wait_for_both
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Close_stream1
  else if v = Unsigned.UInt32.of_int 2 then Close_stream2
  else if v = Unsigned.UInt32.of_int 4 then Wait_for_both
  else raise (Invalid_argument "Unexpected IOStream_splice_flags value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Close_stream1 -> Unsigned.UInt32.of_int 1
  | Close_stream2 -> Unsigned.UInt32.of_int 2
  | Wait_for_both -> Unsigned.UInt32.of_int 4

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Close_stream1 ); ( 2 , Close_stream2 ); ( 4 , Wait_for_both )]
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

let t_list_view = view ~read:list_of_value ~write:list_to_value uint32_t
