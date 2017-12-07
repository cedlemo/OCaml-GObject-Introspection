open Ctypes
open Foreign

type t = Default | Leave_descriptors_open | Do_not_reap_child | Search_path | Stdout_to_dev_null | Stderr_to_dev_null | Child_inherits_stdin | File_and_argv_zero | Search_path_from_envp | Cloexec_pipes
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then Default
  else if v = Unsigned.UInt32.of_int 1 then Leave_descriptors_open
  else if v = Unsigned.UInt32.of_int 2 then Do_not_reap_child
  else if v = Unsigned.UInt32.of_int 4 then Search_path
  else if v = Unsigned.UInt32.of_int 8 then Stdout_to_dev_null
  else if v = Unsigned.UInt32.of_int 16 then Stderr_to_dev_null
  else if v = Unsigned.UInt32.of_int 32 then Child_inherits_stdin
  else if v = Unsigned.UInt32.of_int 64 then File_and_argv_zero
  else if v = Unsigned.UInt32.of_int 128 then Search_path_from_envp
  else if v = Unsigned.UInt32.of_int 256 then Cloexec_pipes
  else raise (Invalid_argument "Unexpected Spawn_flags value")

let to_value = function
  | Default -> Unsigned.UInt32.of_int 0
  | Leave_descriptors_open -> Unsigned.UInt32.of_int 1
  | Do_not_reap_child -> Unsigned.UInt32.of_int 2
  | Search_path -> Unsigned.UInt32.of_int 4
  | Stdout_to_dev_null -> Unsigned.UInt32.of_int 8
  | Stderr_to_dev_null -> Unsigned.UInt32.of_int 16
  | Child_inherits_stdin -> Unsigned.UInt32.of_int 32
  | File_and_argv_zero -> Unsigned.UInt32.of_int 64
  | Search_path_from_envp -> Unsigned.UInt32.of_int 128
  | Cloexec_pipes -> Unsigned.UInt32.of_int 256

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , Default ); ( 1 , Leave_descriptors_open ); ( 2 , Do_not_reap_child ); ( 4 , Search_path ); ( 8 , Stdout_to_dev_null ); ( 16 , Stderr_to_dev_null ); ( 32 , Child_inherits_stdin ); ( 64 , File_and_argv_zero ); ( 128 , Search_path_from_envp ); ( 256 , Cloexec_pipes )]
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
