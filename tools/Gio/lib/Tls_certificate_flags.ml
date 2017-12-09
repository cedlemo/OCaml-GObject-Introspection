open Ctypes
open Foreign

type t = Unknown_ca | Bad_identity | Not_activated | Expired | Revoked | Insecure | Generic_error | Validate_all
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Unknown_ca
  else if v = Unsigned.UInt32.of_int 2 then Bad_identity
  else if v = Unsigned.UInt32.of_int 4 then Not_activated
  else if v = Unsigned.UInt32.of_int 8 then Expired
  else if v = Unsigned.UInt32.of_int 16 then Revoked
  else if v = Unsigned.UInt32.of_int 32 then Insecure
  else if v = Unsigned.UInt32.of_int 64 then Generic_error
  else if v = Unsigned.UInt32.of_int 127 then Validate_all
  else raise (Invalid_argument "Unexpected Tls_certificate_flags value")

let to_value = function
  | Unknown_ca -> Unsigned.UInt32.of_int 1
  | Bad_identity -> Unsigned.UInt32.of_int 2
  | Not_activated -> Unsigned.UInt32.of_int 4
  | Expired -> Unsigned.UInt32.of_int 8
  | Revoked -> Unsigned.UInt32.of_int 16
  | Insecure -> Unsigned.UInt32.of_int 32
  | Generic_error -> Unsigned.UInt32.of_int 64
  | Validate_all -> Unsigned.UInt32.of_int 127

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 1 , Unknown_ca ); ( 2 , Bad_identity ); ( 4 , Not_activated ); ( 8 , Expired ); ( 16 , Revoked ); ( 32 , Insecure ); ( 64 , Generic_error ); ( 127 , Validate_all )]
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
