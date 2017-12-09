open Ctypes
open Foreign

type t = None | Overwrite | Backup | Nofollow_symlinks | All_metadata | No_fallback_for_move | Target_default_perms
type t_list = t list

let of_value v =
  if v = Unsigned.UInt32.of_int 0 then None
  else if v = Unsigned.UInt32.of_int 1 then Overwrite
  else if v = Unsigned.UInt32.of_int 2 then Backup
  else if v = Unsigned.UInt32.of_int 4 then Nofollow_symlinks
  else if v = Unsigned.UInt32.of_int 8 then All_metadata
  else if v = Unsigned.UInt32.of_int 16 then No_fallback_for_move
  else if v = Unsigned.UInt32.of_int 32 then Target_default_perms
  else raise (Invalid_argument "Unexpected File_copy_flags value")

let to_value = function
  | None -> Unsigned.UInt32.of_int 0
  | Overwrite -> Unsigned.UInt32.of_int 1
  | Backup -> Unsigned.UInt32.of_int 2
  | Nofollow_symlinks -> Unsigned.UInt32.of_int 4
  | All_metadata -> Unsigned.UInt32.of_int 8
  | No_fallback_for_move -> Unsigned.UInt32.of_int 16
  | Target_default_perms -> Unsigned.UInt32.of_int 32

let list_of_value v =
  let open Unsigned.UInt32 in
  let all_flags = [( 0 , None ); ( 1 , Overwrite ); ( 2 , Backup ); ( 4 , Nofollow_symlinks ); ( 8 , All_metadata ); ( 16 , No_fallback_for_move ); ( 32 , Target_default_perms )]
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
