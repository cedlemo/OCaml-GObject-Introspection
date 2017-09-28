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

let get_added =
foreign "g_bookmark_file_get_added" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (int64_t))

(*Not implemented g_bookmark_file_get_app_info argument types not handled*)
(*Not implemented g_bookmark_file_get_applications argument types not handled*)
let get_description =
foreign "g_bookmark_file_get_description" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (string))

(*Not implemented g_bookmark_file_get_groups argument types not handled*)
(*Not implemented g_bookmark_file_get_icon argument types not handled*)
let get_is_private =
foreign "g_bookmark_file_get_is_private" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let get_mime_type =
foreign "g_bookmark_file_get_mime_type" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (string))

let get_modified =
foreign "g_bookmark_file_get_modified" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (int64_t))

let get_size =
foreign "g_bookmark_file_get_size" (ptr t_typ @-> returning (int32_t))

let get_title =
foreign "g_bookmark_file_get_title" (ptr t_typ @-> string_opt  @-> ptr_opt (ptr Error.t_typ) @-> returning (string))

(*Not implemented g_bookmark_file_get_uris argument types not handled*)
let get_visited =
foreign "g_bookmark_file_get_visited" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (int64_t))

let has_application =
foreign "g_bookmark_file_has_application" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let has_group =
foreign "g_bookmark_file_has_group" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let has_item =
foreign "g_bookmark_file_has_item" (ptr t_typ @-> string @-> returning (bool))

let load_from_data =
foreign "g_bookmark_file_load_from_data" (ptr t_typ @-> string @-> uint64_t  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let load_from_data_dirs =
foreign "g_bookmark_file_load_from_data_dirs" (ptr t_typ @-> string @-> string_opt  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let load_from_file =
foreign "g_bookmark_file_load_from_file" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let move_item =
foreign "g_bookmark_file_move_item" (ptr t_typ @-> string @-> string_opt  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let remove_application =
foreign "g_bookmark_file_remove_application" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let remove_group =
foreign "g_bookmark_file_remove_group" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let remove_item =
foreign "g_bookmark_file_remove_item" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let set_added =
foreign "g_bookmark_file_set_added" (ptr t_typ @-> string @-> int64_t @-> returning (void))

let set_app_info =
foreign "g_bookmark_file_set_app_info" (ptr t_typ @-> string @-> string @-> string @-> int32_t @-> int64_t  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

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

(*Not implemented g_bookmark_file_to_data argument types not handled*)
let to_file =
foreign "g_bookmark_file_to_file" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let error_quark =
foreign "g_bookmark_file_error_quark" (ptr t_typ @-> returning (uint32_t))


