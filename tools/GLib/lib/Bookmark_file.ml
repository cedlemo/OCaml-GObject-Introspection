open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Bookmark_file"

let add_application =
  foreign "g_bookmark_file_add_application" (ptr t_typ @-> string @-> string_opt @-> string_opt @-> returning (void))

let add_group =
  foreign "g_bookmark_file_add_group" (ptr t_typ @-> string @-> string @-> returning (void))

let free =
  foreign "g_bookmark_file_free" (ptr t_typ @-> returning (void))

let get_added arg1 arg2 =
  let get_added_raw =
    foreign "g_bookmark_file_get_added" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (int64_t))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_added_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

(*Not implemented g_bookmark_file_get_app_info argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_bookmark_file_get_applications argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_description arg1 arg2 =
  let get_description_raw =
    foreign "g_bookmark_file_get_description" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_description_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

(*Not implemented g_bookmark_file_get_groups argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_bookmark_file_get_icon argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_is_private arg1 arg2 =
  let get_is_private_raw =
    foreign "g_bookmark_file_get_is_private" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_is_private_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let get_mime_type arg1 arg2 =
  let get_mime_type_raw =
    foreign "g_bookmark_file_get_mime_type" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_mime_type_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let get_modified arg1 arg2 =
  let get_modified_raw =
    foreign "g_bookmark_file_get_modified" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (int64_t))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_modified_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let get_size =
  foreign "g_bookmark_file_get_size" (ptr t_typ @-> returning (int32_t))

let get_title arg1 arg2 =
  let get_title_raw =
    foreign "g_bookmark_file_get_title" (ptr t_typ @-> string_opt @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_title_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

(*Not implemented g_bookmark_file_get_uris argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_visited arg1 arg2 =
  let get_visited_raw =
    foreign "g_bookmark_file_get_visited" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (int64_t))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_visited_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let has_application arg1 arg2 arg3 =
  let has_application_raw =
    foreign "g_bookmark_file_has_application" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = has_application_raw arg1 arg2 arg3 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let has_group arg1 arg2 arg3 =
  let has_group_raw =
    foreign "g_bookmark_file_has_group" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = has_group_raw arg1 arg2 arg3 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let has_item =
  foreign "g_bookmark_file_has_item" (ptr t_typ @-> string @-> returning (bool))

let load_from_data arg1 arg2 arg3 =
  let load_from_data_raw =
    foreign "g_bookmark_file_load_from_data" (ptr t_typ @-> string @-> uint64_t @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = load_from_data_raw arg1 arg2 arg3 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let load_from_data_dirs arg1 arg2 arg3 =
  let load_from_data_dirs_raw =
    foreign "g_bookmark_file_load_from_data_dirs" (ptr t_typ @-> string @-> string_opt @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = load_from_data_dirs_raw arg1 arg2 arg3 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let load_from_file arg1 arg2 =
  let load_from_file_raw =
    foreign "g_bookmark_file_load_from_file" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = load_from_file_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let move_item arg1 arg2 arg3 =
  let move_item_raw =
    foreign "g_bookmark_file_move_item" (ptr t_typ @-> string @-> string_opt @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = move_item_raw arg1 arg2 arg3 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let remove_application arg1 arg2 arg3 =
  let remove_application_raw =
    foreign "g_bookmark_file_remove_application" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = remove_application_raw arg1 arg2 arg3 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let remove_group arg1 arg2 arg3 =
  let remove_group_raw =
    foreign "g_bookmark_file_remove_group" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = remove_group_raw arg1 arg2 arg3 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let remove_item arg1 arg2 =
  let remove_item_raw =
    foreign "g_bookmark_file_remove_item" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = remove_item_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let set_added =
  foreign "g_bookmark_file_set_added" (ptr t_typ @-> string @-> int64_t @-> returning (void))

let set_app_info arg1 arg2 arg3 arg4 arg5 arg6 =
  let set_app_info_raw =
    foreign "g_bookmark_file_set_app_info" (ptr t_typ @-> string @-> string @-> string @-> int32_t @-> int64_t @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = set_app_info_raw arg1 arg2 arg3 arg4 arg5 arg6 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let set_description =
  foreign "g_bookmark_file_set_description" (ptr t_typ @-> string_opt @-> string @-> returning (void))

let set_groups =
  foreign "g_bookmark_file_set_groups" (ptr t_typ @-> string @-> string_opt @-> uint64_t @-> returning (void))

let set_icon =
  foreign "g_bookmark_file_set_icon" (ptr t_typ @-> string @-> string_opt @-> string @-> returning (void))

let set_is_private =
  foreign "g_bookmark_file_set_is_private" (ptr t_typ @-> string @-> bool @-> returning (void))

let set_mime_type =
  foreign "g_bookmark_file_set_mime_type" (ptr t_typ @-> string @-> string @-> returning (void))

let set_modified =
  foreign "g_bookmark_file_set_modified" (ptr t_typ @-> string @-> int64_t @-> returning (void))

let set_title =
  foreign "g_bookmark_file_set_title" (ptr t_typ @-> string_opt @-> string @-> returning (void))

let set_visited =
  foreign "g_bookmark_file_set_visited" (ptr t_typ @-> string @-> int64_t @-> returning (void))

(*Not implemented g_bookmark_file_to_data argument typeArg_info.InOut or Arg_info.Out not handled*)
let to_file arg1 arg2 =
  let to_file_raw =
    foreign "g_bookmark_file_to_file" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = to_file_raw arg1 arg2 (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)

let error_quark =
  foreign "g_bookmark_file_error_quark" (void @-> returning (uint32_t))

