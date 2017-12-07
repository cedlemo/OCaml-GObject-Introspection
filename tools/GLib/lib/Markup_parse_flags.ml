open Ctypes
open Foreign

type t = Do_not_use_this_unsupported_flag | Treat_cdata_as_text | Prefix_error_position | Ignore_qualified
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Do_not_use_this_unsupported_flag
  else if v = Unsigned.UInt32.of_int 2 then Treat_cdata_as_text
  else if v = Unsigned.UInt32.of_int 4 then Prefix_error_position
  else if v = Unsigned.UInt32.of_int 8 then Ignore_qualified
  else raise (Invalid_argument "Unexpected Markup_parse_flags value")

let to_value = function
  | Do_not_use_this_unsupported_flag -> Unsigned.UInt32.of_int 1
  | Treat_cdata_as_text -> Unsigned.UInt32.of_int 2
  | Prefix_error_position -> Unsigned.UInt32.of_int 4
  | Ignore_qualified -> Unsigned.UInt32.of_int 8

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 1 , Do_not_use_this_unsupported_flag ); ( 2 , Treat_cdata_as_text ); ( 4 , Prefix_error_position ); ( 8 , Ignore_qualified )]
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
