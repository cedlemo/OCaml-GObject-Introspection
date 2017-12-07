open Ctypes

type t
val t_typ : t structure typ

val new_from_directory:
  string -> t structure ptr option -> bool -> (t structure ptr, Error.t structure ptr option) result

(*Not implemented g_settings_schema_source_list_schemas argument typeArg_info.InOut or Arg_info.Out not handled*)
val lookup:
  t structure ptr -> string -> bool -> Settings_schema.t structure ptr option

val ref:
  t structure ptr -> t structure ptr

val unref:
  t structure ptr -> unit

val get_default:
  unit -> t structure ptr

