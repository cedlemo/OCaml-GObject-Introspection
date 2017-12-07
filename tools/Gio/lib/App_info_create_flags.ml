open Ctypes
open Foreign

type t = None | Needs_terminal | Supports_uris | Supports_startup_notification
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Needs_terminal
  else if v = Unsigned.UInt32.of_int 2 then Supports_uris
  else if v = Unsigned.UInt32.of_int 4 then Supports_startup_notification
  else raise (Invalid_argument "Unexpected App_info_create_flags value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Needs_terminal -> Unsigned.UInt32.of_int 1
  | Supports_uris -> Unsigned.UInt32.of_int 2
  | Supports_startup_notification -> Unsigned.UInt32.of_int 4

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Needs_terminal ); ( 2 , Supports_uris ); ( 4 , Supports_startup_notification )]
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
