open Ctypes
open Foreign

type t = None | Retry | Many_tries | Final_try
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 2 then Retry
  else if v = Unsigned.UInt32.of_int 4 then Many_tries
  else if v = Unsigned.UInt32.of_int 8 then Final_try
  else raise (Invalid_argument "Unexpected Tls_password_flags value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Retry -> Unsigned.UInt32.of_int 2
  | Many_tries -> Unsigned.UInt32.of_int 4
  | Final_try -> Unsigned.UInt32.of_int 8

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 2 , Retry ); ( 4 , Many_tries ); ( 8 , Final_try )]
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
