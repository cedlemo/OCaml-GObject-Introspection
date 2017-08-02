open Ctypes

type t
val t_typ : t structure typ
val add_application:
t structure ptr -> string -> string -> string -> unit
val add_group:
t structure ptr -> string -> string -> unit
val free:
t structure ptr -> unit
val get_added:
t structure ptr -> string -> int64
(* Not implemented g_bookmark_file_get_app_info argument types not handled . *)
(* Not implemented g_bookmark_file_get_applications argument types not handled . *)
(* Not implemented g_bookmark_file_get_description return type not handled . *)
(* Not implemented g_bookmark_file_get_groups argument types not handled . *)
(* Not implemented g_bookmark_file_get_icon argument types not handled . *)
val get_is_private:
t structure ptr -> string -> bool
(* Not implemented g_bookmark_file_get_mime_type return type not handled . *)
val get_modified:
t structure ptr -> string -> int64
val get_size:
t structure ptr -> int32
(* Not implemented g_bookmark_file_get_title return type not handled . *)
(* Not implemented g_bookmark_file_get_uris argument types not handled . *)
val get_visited:
t structure ptr -> string -> int64
val has_application:
t structure ptr -> string -> string -> bool
val has_group:
t structure ptr -> string -> string -> bool
val has_item:
t structure ptr -> string -> bool
val load_from_data:
t structure ptr -> string -> Unsigned.uint64 -> bool
val load_from_data_dirs:
t structure ptr -> string -> string -> bool
val load_from_file:
t structure ptr -> string -> bool
val move_item:
t structure ptr -> string -> string -> bool
val remove_application:
t structure ptr -> string -> string -> bool
val remove_group:
t structure ptr -> string -> string -> bool
val remove_item:
t structure ptr -> string -> bool
val set_added:
t structure ptr -> string -> int64 -> unit
val set_app_info:
t structure ptr -> string -> string -> string -> int32 -> int64 -> bool
val set_description:
t structure ptr -> string -> string -> unit
val set_groups:
t structure ptr -> string -> string -> Unsigned.uint64 -> unit
val set_icon:
t structure ptr -> string -> string -> string -> unit
val set_is_private:
t structure ptr -> string -> bool -> unit
val set_mime_type:
t structure ptr -> string -> string -> unit
val set_modified:
t structure ptr -> string -> int64 -> unit
val set_title:
t structure ptr -> string -> string -> unit
val set_visited:
t structure ptr -> string -> int64 -> unit
(* Not implemented g_bookmark_file_to_data argument types not handled . *)
val to_file:
t structure ptr -> string -> bool
val error_quark:
t structure ptr -> Unsigned.uint32

