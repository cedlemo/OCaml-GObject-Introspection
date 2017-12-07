open Ctypes

type t
val t_typ : t structure typ

val new_from_data:
  Bytes.t structure ptr -> (t structure ptr, Error.t structure ptr option) result

val _register:
  t structure ptr -> unit

val _unregister:
  t structure ptr -> unit

(*Not implemented g_resource_enumerate_children return type C Array type for Types.Array tag not handled*)
(*Not implemented g_resource_get_info argument typeArg_info.InOut or Arg_info.Out not handled*)
val lookup_data:
  t structure ptr -> string -> Resource_lookup_flags.t_list -> (Bytes.t structure ptr, Error.t structure ptr option) result

(*Not implemented g_resource_open_stream return type object not handled*)
val ref:
  t structure ptr -> t structure ptr

val unref:
  t structure ptr -> unit

val load:
  string -> (t structure ptr, Error.t structure ptr option) result

