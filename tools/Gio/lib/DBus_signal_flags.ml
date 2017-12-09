open Ctypes
open Foreign

type t = None | No_match_rule | Match_arg0_namespace | Match_arg0_path
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then No_match_rule
  else if v = Unsigned.UInt32.of_int 2 then Match_arg0_namespace
  else if v = Unsigned.UInt32.of_int 4 then Match_arg0_path
  else raise (Invalid_argument "Unexpected DBus_signal_flags value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | No_match_rule -> Unsigned.UInt32.of_int 1
  | Match_arg0_namespace -> Unsigned.UInt32.of_int 2
  | Match_arg0_path -> Unsigned.UInt32.of_int 4

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , No_match_rule ); ( 2 , Match_arg0_namespace ); ( 4 , Match_arg0_path )]
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
