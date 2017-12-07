open Ctypes
open Foreign

type t = None | Watch_mounts | Send_moved | Watch_hard_links | Watch_moves
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Watch_mounts
  else if v = Unsigned.UInt32.of_int 2 then Send_moved
  else if v = Unsigned.UInt32.of_int 4 then Watch_hard_links
  else if v = Unsigned.UInt32.of_int 8 then Watch_moves
  else raise (Invalid_argument "Unexpected File_monitor_flags value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Watch_mounts -> Unsigned.UInt32.of_int 1
  | Send_moved -> Unsigned.UInt32.of_int 2
  | Watch_hard_links -> Unsigned.UInt32.of_int 4
  | Watch_moves -> Unsigned.UInt32.of_int 8

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Watch_mounts ); ( 2 , Send_moved ); ( 4 , Watch_hard_links ); ( 8 , Watch_moves )]
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
