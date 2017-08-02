open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_key_file_new return type not handled . *)
val get_boolean:
t structure ptr -> string -> string -> bool
(* Not implemented g_key_file_get_boolean_list argument types not handled . *)
(* Not implemented g_key_file_get_comment return type not handled . *)
val get_double:
t structure ptr -> string -> string -> float
(* Not implemented g_key_file_get_double_list argument types not handled . *)
(* Not implemented g_key_file_get_groups argument types not handled . *)
val get_int64:
t structure ptr -> string -> string -> int64
val get_integer:
t structure ptr -> string -> string -> int32
(* Not implemented g_key_file_get_integer_list argument types not handled . *)
(* Not implemented g_key_file_get_keys argument types not handled . *)
(* Not implemented g_key_file_get_locale_string return type not handled . *)
(* Not implemented g_key_file_get_locale_string_list argument types not handled . *)
(* Not implemented g_key_file_get_start_group return type not handled . *)
(* Not implemented g_key_file_get_string return type not handled . *)
(* Not implemented g_key_file_get_string_list argument types not handled . *)
val get_uint64:
t structure ptr -> string -> string -> Unsigned.uint64
(* Not implemented g_key_file_get_value return type not handled . *)
val has_group:
t structure ptr -> string -> bool
(* Not implemented g_key_file_load_from_bytes argument types not handled . *)
(* Not implemented g_key_file_load_from_data argument types not handled . *)
(* Not implemented g_key_file_load_from_data_dirs argument types not handled . *)
(* Not implemented g_key_file_load_from_dirs argument types not handled . *)
(* Not implemented g_key_file_load_from_file argument types not handled . *)
val remove_comment:
t structure ptr -> string -> string -> bool
val remove_group:
t structure ptr -> string -> bool
val remove_key:
t structure ptr -> string -> string -> bool
val save_to_file:
t structure ptr -> string -> bool
val set_boolean:
t structure ptr -> string -> string -> bool -> unit
(* Not implemented g_key_file_set_boolean_list argument types not handled . *)
val set_comment:
t structure ptr -> string -> string -> string -> bool
val set_double:
t structure ptr -> string -> string -> float -> unit
(* Not implemented g_key_file_set_double_list argument types not handled . *)
val set_int64:
t structure ptr -> string -> string -> int64 -> unit
val set_integer:
t structure ptr -> string -> string -> int32 -> unit
(* Not implemented g_key_file_set_integer_list argument types not handled . *)
val set_list_separator:
t structure ptr -> int -> unit
val set_locale_string:
t structure ptr -> string -> string -> string -> string -> unit
(* Not implemented g_key_file_set_locale_string_list argument types not handled . *)
val set_string:
t structure ptr -> string -> string -> string -> unit
(* Not implemented g_key_file_set_string_list argument types not handled . *)
val set_uint64:
t structure ptr -> string -> string -> Unsigned.uint64 -> unit
val set_value:
t structure ptr -> string -> string -> string -> unit
(* Not implemented g_key_file_to_data argument types not handled . *)
val unref:
t structure ptr -> unit
val error_quark:
t structure ptr -> Unsigned.uint32

