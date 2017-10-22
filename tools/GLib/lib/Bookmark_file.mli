open Ctypes

type t
val t_typ : t structure typ
val add_application:
  t structure ptr -> string -> string option -> string option -> unit

val add_group:
  t structure ptr -> string -> string -> unit

val free:
  t structure ptr -> unit

val get_added:
  t structure ptr -> string -> Error.t structure ptr ptr option -> int64

(*Not implemented g_bookmark_file_get_app_info argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_bookmark_file_get_applications argument typeArg_info.InOut or Arg_info.Out not handled*)
val get_description:
  t structure ptr -> string -> Error.t structure ptr ptr option -> string

(*Not implemented g_bookmark_file_get_groups argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_bookmark_file_get_icon argument typeArg_info.InOut or Arg_info.Out not handled*)
val get_is_private:
  t structure ptr -> string -> Error.t structure ptr ptr option -> bool

val get_mime_type:
  t structure ptr -> string -> Error.t structure ptr ptr option -> string

val get_modified:
  t structure ptr -> string -> Error.t structure ptr ptr option -> int64

val get_size:
  t structure ptr -> int32

val get_title:
  t structure ptr -> string option -> Error.t structure ptr ptr option -> string

(*Not implemented g_bookmark_file_get_uris argument typeArg_info.InOut or Arg_info.Out not handled*)
val get_visited:
  t structure ptr -> string -> Error.t structure ptr ptr option -> int64

val has_application:
  t structure ptr -> string -> string -> Error.t structure ptr ptr option -> bool

val has_group:
  t structure ptr -> string -> string -> Error.t structure ptr ptr option -> bool

val has_item:
  t structure ptr -> string -> bool

val load_from_data:
  t structure ptr -> string -> Unsigned.uint64 -> Error.t structure ptr ptr option -> bool

val load_from_data_dirs:
  t structure ptr -> string -> string option -> Error.t structure ptr ptr option -> bool

val load_from_file:
  t structure ptr -> string -> Error.t structure ptr ptr option -> bool

val move_item:
  t structure ptr -> string -> string option -> Error.t structure ptr ptr option -> bool

val remove_application:
  t structure ptr -> string -> string -> Error.t structure ptr ptr option -> bool

val remove_group:
  t structure ptr -> string -> string -> Error.t structure ptr ptr option -> bool

val remove_item:
  t structure ptr -> string -> Error.t structure ptr ptr option -> bool

val set_added:
  t structure ptr -> string -> int64 -> unit

val set_app_info:
  t structure ptr -> string -> string -> string -> int32 -> int64 -> Error.t structure ptr ptr option -> bool

val set_description:
  t structure ptr -> string option -> string -> unit

val set_groups:
  t structure ptr -> string -> string option -> Unsigned.uint64 -> unit

val set_icon:
  t structure ptr -> string -> string option -> string -> unit

val set_is_private:
  t structure ptr -> string -> bool -> unit

val set_mime_type:
  t structure ptr -> string -> string -> unit

val set_modified:
  t structure ptr -> string -> int64 -> unit

val set_title:
  t structure ptr -> string option -> string -> unit

val set_visited:
  t structure ptr -> string -> int64 -> unit

(*Not implemented g_bookmark_file_to_data argument typeArg_info.InOut or Arg_info.Out not handled*)
val to_file:
  t structure ptr -> string -> Error.t structure ptr ptr option -> bool

val error_quark:
  t structure ptr -> Unsigned.uint32


