open Ctypes
open Foreign

type t = Flags_none | Is_service | Is_launcher | Handles_open | Handles_command_line | Send_environment | Non_unique | Can_override_app_id
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Flags_none
  else if v = Unsigned.UInt32.of_int 1 then Is_service
  else if v = Unsigned.UInt32.of_int 2 then Is_launcher
  else if v = Unsigned.UInt32.of_int 4 then Handles_open
  else if v = Unsigned.UInt32.of_int 8 then Handles_command_line
  else if v = Unsigned.UInt32.of_int 16 then Send_environment
  else if v = Unsigned.UInt32.of_int 32 then Non_unique
  else if v = Unsigned.UInt32.of_int 64 then Can_override_app_id
  else raise (Invalid_argument "Unexpected Application_flags value")

let to_value =  function
  | Flags_none -> Unsigned.UInt32.of_int 0
  | Is_service -> Unsigned.UInt32.of_int 1
  | Is_launcher -> Unsigned.UInt32.of_int 2
  | Handles_open -> Unsigned.UInt32.of_int 4
  | Handles_command_line -> Unsigned.UInt32.of_int 8
  | Send_environment -> Unsigned.UInt32.of_int 16
  | Non_unique -> Unsigned.UInt32.of_int 32
  | Can_override_app_id -> Unsigned.UInt32.of_int 64

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , Flags_none ); ( 1 , Is_service ); ( 2 , Is_launcher ); ( 4 , Handles_open ); ( 8 , Handles_command_line ); ( 16 , Send_environment ); ( 32 , Non_unique ); ( 64 , Can_override_app_id )]
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
