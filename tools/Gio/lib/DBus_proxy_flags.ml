open Ctypes
open Foreign

type t = None | Do_not_load_properties | Do_not_connect_signals | Do_not_auto_start | Get_invalidated_properties | Do_not_auto_start_at_construction
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Do_not_load_properties
  else if v = Unsigned.UInt32.of_int 2 then Do_not_connect_signals
  else if v = Unsigned.UInt32.of_int 4 then Do_not_auto_start
  else if v = Unsigned.UInt32.of_int 8 then Get_invalidated_properties
  else if v = Unsigned.UInt32.of_int 16 then Do_not_auto_start_at_construction
  else raise (Invalid_argument "Unexpected DBus_proxy_flags value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Do_not_load_properties -> Unsigned.UInt32.of_int 1
  | Do_not_connect_signals -> Unsigned.UInt32.of_int 2
  | Do_not_auto_start -> Unsigned.UInt32.of_int 4
  | Get_invalidated_properties -> Unsigned.UInt32.of_int 8
  | Do_not_auto_start_at_construction -> Unsigned.UInt32.of_int 16

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Do_not_load_properties ); ( 2 , Do_not_connect_signals ); ( 4 , Do_not_auto_start ); ( 8 , Get_invalidated_properties ); ( 16 , Do_not_auto_start_at_construction )]
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
