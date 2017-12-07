open Ctypes
open Foreign

type t = None | Authentication_client | Authentication_server | Authentication_allow_anonymous | Message_bus_connection | Delay_message_processing
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Authentication_client
  else if v = Unsigned.UInt32.of_int 2 then Authentication_server
  else if v = Unsigned.UInt32.of_int 4 then Authentication_allow_anonymous
  else if v = Unsigned.UInt32.of_int 8 then Message_bus_connection
  else if v = Unsigned.UInt32.of_int 16 then Delay_message_processing
  else raise (Invalid_argument "Unexpected DBus_connection_flags value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Authentication_client -> Unsigned.UInt32.of_int 1
  | Authentication_server -> Unsigned.UInt32.of_int 2
  | Authentication_allow_anonymous -> Unsigned.UInt32.of_int 4
  | Message_bus_connection -> Unsigned.UInt32.of_int 8
  | Delay_message_processing -> Unsigned.UInt32.of_int 16

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Authentication_client ); ( 2 , Authentication_server ); ( 4 , Authentication_allow_anonymous ); ( 8 , Message_bus_connection ); ( 16 , Delay_message_processing )]
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
