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
let get_added self uri =
  let get_added_raw =
    foreign "g_bookmark_file_get_added" (ptr t_typ @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (int64_t))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_added_raw self uri (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
(* Not implemented g_bookmark_file_get_app_info - out argument not handled
(ptr t_typ @-> string @-> string @-> returning (bool * string * uint32_t * int64_t))
*)
(*Not implemented g_bookmark_file_get_applications return type C Array type for Types.Array tag not handled*)
let get_description self uri =
  let get_description_raw =
    foreign "g_bookmark_file_get_description" (ptr t_typ @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_description_raw self uri (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
(*Not implemented g_bookmark_file_get_groups return type C Array type for Types.Array tag not handled*)
(* Not implemented g_bookmark_file_get_icon - out argument not handled
(ptr t_typ @-> string @-> returning (bool * string * string))
*)
let get_is_private self uri =
  let get_is_private_raw =
    foreign "g_bookmark_file_get_is_private" (ptr t_typ @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_is_private_raw self uri (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let get_mime_type self uri =
  let get_mime_type_raw =
    foreign "g_bookmark_file_get_mime_type" (ptr t_typ @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_mime_type_raw self uri (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let get_modified self uri =
  let get_modified_raw =
    foreign "g_bookmark_file_get_modified" (ptr t_typ @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (int64_t))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_modified_raw self uri (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let get_size =
  foreign "g_bookmark_file_get_size" (ptr t_typ @-> returning (int32_t))
let get_title self uri =
  let get_title_raw =
    foreign "g_bookmark_file_get_title" (ptr t_typ @-> string_opt@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_title_raw self uri (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
(*Not implemented g_bookmark_file_get_uris return type C Array type for Types.Array tag not handled*)
let get_visited self uri =
  let get_visited_raw =
    foreign "g_bookmark_file_get_visited" (ptr t_typ @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (int64_t))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = get_visited_raw self uri (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let has_application self uri name =
  let has_application_raw =
    foreign "g_bookmark_file_has_application" (ptr t_typ @-> string @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = has_application_raw self uri name (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let has_group self uri group =
  let has_group_raw =
    foreign "g_bookmark_file_has_group" (ptr t_typ @-> string @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = has_group_raw self uri group (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let has_item =
  foreign "g_bookmark_file_has_item" (ptr t_typ @-> string @-> returning (bool))
let load_from_data self data length =
  let load_from_data_raw =
    foreign "g_bookmark_file_load_from_data" (ptr t_typ @-> string @-> uint64_t@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = load_from_data_raw self data length (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let load_from_data_dirs self file full_path =
  let load_from_data_dirs_raw =
    foreign "g_bookmark_file_load_from_data_dirs" (ptr t_typ @-> string @-> string_opt@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = load_from_data_dirs_raw self file full_path (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let load_from_file self filename =
  let load_from_file_raw =
    foreign "g_bookmark_file_load_from_file" (ptr t_typ @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = load_from_file_raw self filename (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let move_item self old_uri new_uri =
  let move_item_raw =
    foreign "g_bookmark_file_move_item" (ptr t_typ @-> string @-> string_opt@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = move_item_raw self old_uri new_uri (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let remove_application self uri name =
  let remove_application_raw =
    foreign "g_bookmark_file_remove_application" (ptr t_typ @-> string @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = remove_application_raw self uri name (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let remove_group self uri group =
  let remove_group_raw =
    foreign "g_bookmark_file_remove_group" (ptr t_typ @-> string @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = remove_group_raw self uri group (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let remove_item self uri =
  let remove_item_raw =
    foreign "g_bookmark_file_remove_item" (ptr t_typ @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = remove_item_raw self uri (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let set_added =
  foreign "g_bookmark_file_set_added" (ptr t_typ @-> string @-> int64_t @-> returning (void))
let set_app_info self uri name exec count stamp =
  let set_app_info_raw =
    foreign "g_bookmark_file_set_app_info" (ptr t_typ @-> string @-> string @-> string @-> int32_t @-> int64_t@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = set_app_info_raw self uri name exec count stamp (Some err_ptr_ptr) in
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
(* Not implemented g_bookmark_file_to_data - out argument not handled
(ptr t_typ @-> returning (string * uint64_t))
*)
let to_file self filename =
  let to_file_raw =
    foreign "g_bookmark_file_to_file" (ptr t_typ @-> string@-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
  in
  let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
  let value = to_file_raw self filename (Some err_ptr_ptr) in
  match (!@ err_ptr_ptr) with
   | None -> Ok value
   | Some _ -> let err_ptr = !@ err_ptr_ptr in
     let _ = Gc.finalise (function | Some e -> Error.free e | None -> () ) err_ptr in
     Error (err_ptr)
let error_quark =
  foreign "g_bookmark_file_error_quark" (void @-> returning (uint32_t))
