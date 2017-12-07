open Ctypes

type t
val t_typ : t structure typ

val get_id:
  t structure ptr -> string

val get_key:
  t structure ptr -> string -> Settings_schema_key.t structure ptr

val get_path:
  t structure ptr -> string

val has_key:
  t structure ptr -> string -> bool

(*Not implemented g_settings_schema_list_children return type C Array type for Types.Array tag not handled*)
(*Not implemented g_settings_schema_list_keys return type C Array type for Types.Array tag not handled*)
val ref:
  t structure ptr -> t structure ptr

val unref:
  t structure ptr -> unit

