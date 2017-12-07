open Ctypes
open Foreign

type t = Need_password | Need_username | Need_domain | Saving_supported | Anonymous_supported
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Need_password
  else if v = Unsigned.UInt32.of_int 2 then Need_username
  else if v = Unsigned.UInt32.of_int 4 then Need_domain
  else if v = Unsigned.UInt32.of_int 8 then Saving_supported
  else if v = Unsigned.UInt32.of_int 16 then Anonymous_supported
  else raise (Invalid_argument "Unexpected Ask_password_flags value")

let to_value =  function
  | Need_password -> Unsigned.UInt32.of_int 1
  | Need_username -> Unsigned.UInt32.of_int 2
  | Need_domain -> Unsigned.UInt32.of_int 4
  | Saving_supported -> Unsigned.UInt32.of_int 8
  | Anonymous_supported -> Unsigned.UInt32.of_int 16

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 1 , Need_password ); ( 2 , Need_username ); ( 4 , Need_domain ); ( 8 , Saving_supported ); ( 16 , Anonymous_supported )]
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
