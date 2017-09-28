open Ctypes

type t
val t_typ : t structure typ
val _new:
t structure ptr -> (* interface *) t structure ptr

val get_boolean:
t structure ptr -> string -> string -> Error.t structure ptr ptr option -> bool

(*Not implemented g_key_file_get_boolean_list argument types not handled*)
val get_comment:
t structure ptr -> string option -> string -> Error.t structure ptr ptr option -> string

val get_double:
t structure ptr -> string -> string -> Error.t structure ptr ptr option -> float

(*Not implemented g_key_file_get_double_list argument types not handled*)
(*Not implemented g_key_file_get_groups argument types not handled*)
val get_int64:
t structure ptr -> string -> string -> Error.t structure ptr ptr option -> int64

val get_integer:
t structure ptr -> string -> string -> Error.t structure ptr ptr option -> int32

(*Not implemented g_key_file_get_integer_list argument types not handled*)
(*Not implemented g_key_file_get_keys argument types not handled*)
val get_locale_string:
t structure ptr -> string -> string -> string option -> Error.t structure ptr ptr option -> string

(*Not implemented g_key_file_get_locale_string_list argument types not handled*)
val get_start_group:
t structure ptr -> string

val get_string:
t structure ptr -> string -> string -> Error.t structure ptr ptr option -> string

(*Not implemented g_key_file_get_string_list argument types not handled*)
val get_uint64:
t structure ptr -> string -> string -> Error.t structure ptr ptr option -> Unsigned.uint64

val get_value:
t structure ptr -> string -> string -> Error.t structure ptr ptr option -> string

val has_group:
t structure ptr -> string -> bool

val load_from_bytes:
t structure ptr -> (* interface *) Bytes.t structure ptr -> (* interface *) Key_file_flags.t_list -> Error.t structure ptr ptr option -> bool

val load_from_data:
t structure ptr -> string -> Unsigned.uint64 -> (* interface *) Key_file_flags.t_list -> Error.t structure ptr ptr option -> bool

(*Not implemented g_key_file_load_from_data_dirs argument types not handled*)
(*Not implemented g_key_file_load_from_dirs argument types not handled*)
val load_from_file:
t structure ptr -> string -> (* interface *) Key_file_flags.t_list -> Error.t structure ptr ptr option -> bool

val remove_comment:
t structure ptr -> string option -> string option -> Error.t structure ptr ptr option -> bool

val remove_group:
t structure ptr -> string -> Error.t structure ptr ptr option -> bool

val remove_key:
t structure ptr -> string -> string -> Error.t structure ptr ptr option -> bool

val save_to_file:
t structure ptr -> string -> Error.t structure ptr ptr option -> bool

val set_boolean:
t structure ptr -> string -> string -> bool -> unit

(*Not implemented g_key_file_set_boolean_list argument types not handled*)
val set_comment:
t structure ptr -> string option -> string option -> string -> Error.t structure ptr ptr option -> bool

val set_double:
t structure ptr -> string -> string -> float -> unit

(*Not implemented g_key_file_set_double_list argument types not handled*)
val set_int64:
t structure ptr -> string -> string -> int64 -> unit

val set_integer:
t structure ptr -> string -> string -> int32 -> unit

(*Not implemented g_key_file_set_integer_list argument types not handled*)
val set_list_separator:
t structure ptr -> int -> unit

val set_locale_string:
t structure ptr -> string -> string -> string -> string -> unit

(*Not implemented g_key_file_set_locale_string_list argument types not handled*)
val set_string:
t structure ptr -> string -> string -> string -> unit

(*Not implemented g_key_file_set_string_list argument types not handled*)
val set_uint64:
t structure ptr -> string -> string -> Unsigned.uint64 -> unit

val set_value:
t structure ptr -> string -> string -> string -> unit

(*Not implemented g_key_file_to_data argument types not handled*)
val unref:
t structure ptr -> unit

val error_quark:
t structure ptr -> Unsigned.uint32


