open Ctypes
open Foreign

type t = None | Report_any_error | Apparent_size | No_xdev
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 2 then Report_any_error
  else if v = Unsigned.UInt32.of_int 4 then Apparent_size
  else if v = Unsigned.UInt32.of_int 8 then No_xdev
  else raise (Invalid_argument "Unexpected File_measure_flags value")

let to_value =  function
  | None -> Unsigned.UInt32.of_int 0
  | Report_any_error -> Unsigned.UInt32.of_int 2
  | Apparent_size -> Unsigned.UInt32.of_int 4
  | No_xdev -> Unsigned.UInt32.of_int 8

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 2 , Report_any_error ); ( 4 , Apparent_size ); ( 8 , No_xdev )]
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
