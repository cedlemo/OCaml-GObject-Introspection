open Ctypes
open Foreign

type t = Leaves | Non_leaves | All | Mask | Leafs | Non_leafs
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Leaves
  else if v = Unsigned.UInt32.of_int 2 then Non_leaves
  else if v = Unsigned.UInt32.of_int 3 then All
  else if v = Unsigned.UInt32.of_int 3 then Mask
  else if v = Unsigned.UInt32.of_int 1 then Leafs
  else if v = Unsigned.UInt32.of_int 2 then Non_leafs
  else raise (Invalid_argument "Unexpected Traverse_flags value")

let to_value = function
  | Leaves -> Unsigned.UInt32.of_int 1
  | Non_leaves -> Unsigned.UInt32.of_int 2
  | All -> Unsigned.UInt32.of_int 3
  | Mask -> Unsigned.UInt32.of_int 3
  | Leafs -> Unsigned.UInt32.of_int 1
  | Non_leafs -> Unsigned.UInt32.of_int 2

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 1 , Leaves ); ( 2 , Non_leaves ); ( 3 , All ); ( 3 , Mask ); ( 1 , Leafs ); ( 2 , Non_leafs )]
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
