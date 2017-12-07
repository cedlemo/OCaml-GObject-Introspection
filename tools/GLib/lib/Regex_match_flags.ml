open Ctypes
open Foreign

type t = Anchored | Notbol | Noteol | Notempty | Partial | Newline_cr | Newline_lf | Newline_crlf | Newline_any | Newline_anycrlf | Bsr_anycrlf | Bsr_any | Partial_soft | Partial_hard | Notempty_atstart
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 16 then Anchored
  else if v = Unsigned.UInt32.of_int 128 then Notbol
  else if v = Unsigned.UInt32.of_int 256 then Noteol
  else if v = Unsigned.UInt32.of_int 1024 then Notempty
  else if v = Unsigned.UInt32.of_int 32768 then Partial
  else if v = Unsigned.UInt32.of_int 1048576 then Newline_cr
  else if v = Unsigned.UInt32.of_int 2097152 then Newline_lf
  else if v = Unsigned.UInt32.of_int 3145728 then Newline_crlf
  else if v = Unsigned.UInt32.of_int 4194304 then Newline_any
  else if v = Unsigned.UInt32.of_int 5242880 then Newline_anycrlf
  else if v = Unsigned.UInt32.of_int 8388608 then Bsr_anycrlf
  else if v = Unsigned.UInt32.of_int 16777216 then Bsr_any
  else if v = Unsigned.UInt32.of_int 32768 then Partial_soft
  else if v = Unsigned.UInt32.of_int 134217728 then Partial_hard
  else if v = Unsigned.UInt32.of_int 268435456 then Notempty_atstart
  else raise (Invalid_argument "Unexpected Regex_match_flags value")

let to_value = function
  | Anchored -> Unsigned.UInt32.of_int 16
  | Notbol -> Unsigned.UInt32.of_int 128
  | Noteol -> Unsigned.UInt32.of_int 256
  | Notempty -> Unsigned.UInt32.of_int 1024
  | Partial -> Unsigned.UInt32.of_int 32768
  | Newline_cr -> Unsigned.UInt32.of_int 1048576
  | Newline_lf -> Unsigned.UInt32.of_int 2097152
  | Newline_crlf -> Unsigned.UInt32.of_int 3145728
  | Newline_any -> Unsigned.UInt32.of_int 4194304
  | Newline_anycrlf -> Unsigned.UInt32.of_int 5242880
  | Bsr_anycrlf -> Unsigned.UInt32.of_int 8388608
  | Bsr_any -> Unsigned.UInt32.of_int 16777216
  | Partial_soft -> Unsigned.UInt32.of_int 32768
  | Partial_hard -> Unsigned.UInt32.of_int 134217728
  | Notempty_atstart -> Unsigned.UInt32.of_int 268435456

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 16 , Anchored ); ( 128 , Notbol ); ( 256 , Noteol ); ( 1024 , Notempty ); ( 32768 , Partial ); ( 1048576 , Newline_cr ); ( 2097152 , Newline_lf ); ( 3145728 , Newline_crlf ); ( 4194304 , Newline_any ); ( 5242880 , Newline_anycrlf ); ( 8388608 , Bsr_anycrlf ); ( 16777216 , Bsr_any ); ( 32768 , Partial_soft ); ( 134217728 , Partial_hard ); ( 268435456 , Notempty_atstart )]
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
