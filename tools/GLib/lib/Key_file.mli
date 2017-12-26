open Ctypes

type t
val t_typ : t structure typ

val create:
  unit -> t structure ptr
val get_boolean:
  t structure ptr -> string -> string -> (bool, Error.t structure ptr option) result
(*Not implemented g_key_file_get_boolean_list return type C Array type for Types.Array tag not handled*)
val get_comment:
  t structure ptr -> string option -> string -> (string option, Error.t structure ptr option) result
val get_double:
  t structure ptr -> string -> string -> (float, Error.t structure ptr option) result
(*Not implemented g_key_file_get_double_list return type C Array type for Types.Array tag not handled*)
(*Not implemented g_key_file_get_groups return type C Array type for Types.Array tag not handled*)
val get_int64:
  t structure ptr -> string -> string -> (int64, Error.t structure ptr option) result
val get_integer:
  t structure ptr -> string -> string -> (int32, Error.t structure ptr option) result
(*Not implemented g_key_file_get_integer_list return type C Array type for Types.Array tag not handled*)
(*Not implemented g_key_file_get_keys return type C Array type for Types.Array tag not handled*)
val get_locale_string:
  t structure ptr -> string -> string -> string option -> (string option, Error.t structure ptr option) result
(*Not implemented g_key_file_get_locale_string_list return type C Array type for Types.Array tag not handled*)
val get_start_group:
  t structure ptr -> string
val get_string:
  t structure ptr -> string -> string -> (string option, Error.t structure ptr option) result
(*Not implemented g_key_file_get_string_list return type C Array type for Types.Array tag not handled*)
val get_uint64:
  t structure ptr -> string -> string -> (Unsigned.uint64, Error.t structure ptr option) result
val get_value:
  t structure ptr -> string -> string -> (string option, Error.t structure ptr option) result
val has_group:
  t structure ptr -> string -> bool
(*SKIPPED :  g_key_file_load_from_bytes type Bytes.t structure ptr skipped*)
val load_from_data:
  t structure ptr -> string -> Unsigned.uint64 -> Key_file_flags.t_list -> (bool, Error.t structure ptr option) result
(* Not implemented g_key_file_load_from_data_dirs - out argument not handled
t structure ptr -> string -> Key_file_flags.t_list -> (bool, string)
*)
(*Not implemented g_key_file_load_from_dirs type C Array type for Types.Array tag not implemented*)
val load_from_file:
  t structure ptr -> string -> Key_file_flags.t_list -> (bool, Error.t structure ptr option) result
val remove_comment:
  t structure ptr -> string option -> string option -> (bool, Error.t structure ptr option) result
val remove_group:
  t structure ptr -> string -> (bool, Error.t structure ptr option) result
val remove_key:
  t structure ptr -> string -> string -> (bool, Error.t structure ptr option) result
val save_to_file:
  t structure ptr -> string -> (bool, Error.t structure ptr option) result
val set_boolean:
  t structure ptr -> string -> string -> bool -> unit
(*Not implemented g_key_file_set_boolean_list type C Array type for Types.Array tag not implemented*)
val set_comment:
  t structure ptr -> string option -> string option -> string -> (bool, Error.t structure ptr option) result
val set_double:
  t structure ptr -> string -> string -> float -> unit
(*Not implemented g_key_file_set_double_list type C Array type for Types.Array tag not implemented*)
val set_int64:
  t structure ptr -> string -> string -> int64 -> unit
val set_integer:
  t structure ptr -> string -> string -> int32 -> unit
(*Not implemented g_key_file_set_integer_list type C Array type for Types.Array tag not implemented*)
val set_list_separator:
  t structure ptr -> int -> unit
val set_locale_string:
  t structure ptr -> string -> string -> string -> string -> unit
(*Not implemented g_key_file_set_locale_string_list type C Array type for Types.Array tag not implemented*)
val set_string:
  t structure ptr -> string -> string -> string -> unit
(*Not implemented g_key_file_set_string_list type C Array type for Types.Array tag not implemented*)
val set_uint64:
  t structure ptr -> string -> string -> Unsigned.uint64 -> unit
val set_value:
  t structure ptr -> string -> string -> string -> unit
(* Not implemented g_key_file_to_data - out argument not handled
t structure ptr -> (string, Unsigned.uint64)
*)
val unref:
  t structure ptr -> unit
val error_quark:
  unit -> Unsigned.uint32
