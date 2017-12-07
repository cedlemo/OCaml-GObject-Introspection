open Ctypes
open Foreign

type t = Invalid | String | Strdup | Boolean | Tristate | Optional
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Invalid
  else if v = Unsigned.UInt32.of_int 1 then String
  else if v = Unsigned.UInt32.of_int 2 then Strdup
  else if v = Unsigned.UInt32.of_int 3 then Boolean
  else if v = Unsigned.UInt32.of_int 4 then Tristate
  else if v = Unsigned.UInt32.of_int 65536 then Optional
  else raise (Invalid_argument "Unexpected Markup_collect_type value")

let to_value = function
  | Invalid -> Unsigned.UInt32.of_int 0
  | String -> Unsigned.UInt32.of_int 1
  | Strdup -> Unsigned.UInt32.of_int 2
  | Boolean -> Unsigned.UInt32.of_int 3
  | Tristate -> Unsigned.UInt32.of_int 4
  | Optional -> Unsigned.UInt32.of_int 65536

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , Invalid ); ( 1 , String ); ( 2 , Strdup ); ( 3 , Boolean ); ( 4 , Tristate ); ( 65536 , Optional )]
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
