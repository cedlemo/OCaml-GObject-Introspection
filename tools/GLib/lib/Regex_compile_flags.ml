open Ctypes
open Foreign

type t = Caseless | Multiline | Dotall | Extended | Anchored | Dollar_endonly | Ungreedy | Raw | No_auto_capture | Optimize | Firstline | Dupnames | Newline_cr | Newline_lf | Newline_crlf | Newline_anycrlf | Bsr_anycrlf | Javascript_compat
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 1 then Caseless
  else if v = Unsigned.UInt32.of_int 2 then Multiline
  else if v = Unsigned.UInt32.of_int 4 then Dotall
  else if v = Unsigned.UInt32.of_int 8 then Extended
  else if v = Unsigned.UInt32.of_int 16 then Anchored
  else if v = Unsigned.UInt32.of_int 32 then Dollar_endonly
  else if v = Unsigned.UInt32.of_int 512 then Ungreedy
  else if v = Unsigned.UInt32.of_int 2048 then Raw
  else if v = Unsigned.UInt32.of_int 4096 then No_auto_capture
  else if v = Unsigned.UInt32.of_int 8192 then Optimize
  else if v = Unsigned.UInt32.of_int 262144 then Firstline
  else if v = Unsigned.UInt32.of_int 524288 then Dupnames
  else if v = Unsigned.UInt32.of_int 1048576 then Newline_cr
  else if v = Unsigned.UInt32.of_int 2097152 then Newline_lf
  else if v = Unsigned.UInt32.of_int 3145728 then Newline_crlf
  else if v = Unsigned.UInt32.of_int 5242880 then Newline_anycrlf
  else if v = Unsigned.UInt32.of_int 8388608 then Bsr_anycrlf
  else if v = Unsigned.UInt32.of_int 33554432 then Javascript_compat
  else raise (Invalid_argument "Unexpected Regex_compile_flags value")

let to_value = function
  | Caseless -> Unsigned.UInt32.of_int 1
  | Multiline -> Unsigned.UInt32.of_int 2
  | Dotall -> Unsigned.UInt32.of_int 4
  | Extended -> Unsigned.UInt32.of_int 8
  | Anchored -> Unsigned.UInt32.of_int 16
  | Dollar_endonly -> Unsigned.UInt32.of_int 32
  | Ungreedy -> Unsigned.UInt32.of_int 512
  | Raw -> Unsigned.UInt32.of_int 2048
  | No_auto_capture -> Unsigned.UInt32.of_int 4096
  | Optimize -> Unsigned.UInt32.of_int 8192
  | Firstline -> Unsigned.UInt32.of_int 262144
  | Dupnames -> Unsigned.UInt32.of_int 524288
  | Newline_cr -> Unsigned.UInt32.of_int 1048576
  | Newline_lf -> Unsigned.UInt32.of_int 2097152
  | Newline_crlf -> Unsigned.UInt32.of_int 3145728
  | Newline_anycrlf -> Unsigned.UInt32.of_int 5242880
  | Bsr_anycrlf -> Unsigned.UInt32.of_int 8388608
  | Javascript_compat -> Unsigned.UInt32.of_int 33554432

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 1 , Caseless ); ( 2 , Multiline ); ( 4 , Dotall ); ( 8 , Extended ); ( 16 , Anchored ); ( 32 , Dollar_endonly ); ( 512 , Ungreedy ); ( 2048 , Raw ); ( 4096 , No_auto_capture ); ( 8192 , Optimize ); ( 262144 , Firstline ); ( 524288 , Dupnames ); ( 1048576 , Newline_cr ); ( 2097152 , Newline_lf ); ( 3145728 , Newline_crlf ); ( 5242880 , Newline_anycrlf ); ( 8388608 , Bsr_anycrlf ); ( 33554432 , Javascript_compat )]
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
