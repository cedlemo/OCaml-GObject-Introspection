open Ctypes
open Foreign

type t = Default | Get | Set | No_sensitivity | Get_no_changes | Invert_boolean
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Default
  else if v = Unsigned.UInt32.of_int 1 then Get
  else if v = Unsigned.UInt32.of_int 2 then Set
  else if v = Unsigned.UInt32.of_int 4 then No_sensitivity
  else if v = Unsigned.UInt32.of_int 8 then Get_no_changes
  else if v = Unsigned.UInt32.of_int 16 then Invert_boolean
  else raise (Invalid_argument "Unexpected Settings_bind_flags value")

let to_value = function
  | Default -> Unsigned.UInt32.of_int 0
  | Get -> Unsigned.UInt32.of_int 1
  | Set -> Unsigned.UInt32.of_int 2
  | No_sensitivity -> Unsigned.UInt32.of_int 4
  | Get_no_changes -> Unsigned.UInt32.of_int 8
  | Invert_boolean -> Unsigned.UInt32.of_int 16

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , Default ); ( 1 , Get ); ( 2 , Set ); ( 4 , No_sensitivity ); ( 8 , Get_no_changes ); ( 16 , Invert_boolean )]
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
