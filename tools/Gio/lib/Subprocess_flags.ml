open Ctypes
open Foreign

type t = None | Stdin_pipe | Stdin_inherit | Stdout_pipe | Stdout_silence | Stderr_pipe | Stderr_silence | Stderr_merge | Inherit_fds
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Stdin_pipe
  else if v = Unsigned.UInt32.of_int 2 then Stdin_inherit
  else if v = Unsigned.UInt32.of_int 4 then Stdout_pipe
  else if v = Unsigned.UInt32.of_int 8 then Stdout_silence
  else if v = Unsigned.UInt32.of_int 16 then Stderr_pipe
  else if v = Unsigned.UInt32.of_int 32 then Stderr_silence
  else if v = Unsigned.UInt32.of_int 64 then Stderr_merge
  else if v = Unsigned.UInt32.of_int 128 then Inherit_fds
  else raise (Invalid_argument "Unexpected Subprocess_flags value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Stdin_pipe -> Unsigned.UInt32.of_int 1
  | Stdin_inherit -> Unsigned.UInt32.of_int 2
  | Stdout_pipe -> Unsigned.UInt32.of_int 4
  | Stdout_silence -> Unsigned.UInt32.of_int 8
  | Stderr_pipe -> Unsigned.UInt32.of_int 16
  | Stderr_silence -> Unsigned.UInt32.of_int 32
  | Stderr_merge -> Unsigned.UInt32.of_int 64
  | Inherit_fds -> Unsigned.UInt32.of_int 128

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Stdin_pipe ); ( 2 , Stdin_inherit ); ( 4 , Stdout_pipe ); ( 8 , Stdout_silence ); ( 16 , Stderr_pipe ); ( 32 , Stderr_silence ); ( 64 , Stderr_merge ); ( 128 , Inherit_fds )]
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
