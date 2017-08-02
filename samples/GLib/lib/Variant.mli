open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_variant_new_array argument types not handled . *)
(* Not implemented g_variant_new_boolean return type not handled . *)
(* Not implemented g_variant_new_byte return type not handled . *)
(* Not implemented g_variant_new_bytestring argument types not handled . *)
(* Not implemented g_variant_new_bytestring_array argument types not handled . *)
(* Not implemented g_variant_new_dict_entry argument types not handled . *)
(* Not implemented g_variant_new_double return type not handled . *)
(* Not implemented g_variant_new_fixed_array argument types not handled . *)
(* Not implemented g_variant_new_from_bytes argument types not handled . *)
(* Not implemented g_variant_new_from_data argument types not handled . *)
(* Not implemented g_variant_new_handle return type not handled . *)
(* Not implemented g_variant_new_int16 return type not handled . *)
(* Not implemented g_variant_new_int32 return type not handled . *)
(* Not implemented g_variant_new_int64 return type not handled . *)
(* Not implemented g_variant_new_maybe argument types not handled . *)
(* Not implemented g_variant_new_object_path return type not handled . *)
(* Not implemented g_variant_new_objv argument types not handled . *)
(* Not implemented g_variant_new_signature return type not handled . *)
(* Not implemented g_variant_new_string return type not handled . *)
(* Not implemented g_variant_new_strv argument types not handled . *)
(* Not implemented g_variant_new_tuple argument types not handled . *)
(* Not implemented g_variant_new_uint16 return type not handled . *)
(* Not implemented g_variant_new_uint32 return type not handled . *)
(* Not implemented g_variant_new_uint64 return type not handled . *)
(* Not implemented g_variant_new_variant argument types not handled . *)
(* Not implemented g_variant_byteswap return type not handled . *)
val check_format_string:
t structure ptr -> string -> bool -> bool
(* Not implemented g_variant_classify return type not handled . *)
(* Not implemented g_variant_compare argument types not handled . *)
(* Not implemented g_variant_dup_bytestring argument types not handled . *)
(* Not implemented g_variant_dup_bytestring_array argument types not handled . *)
(* Not implemented g_variant_dup_objv argument types not handled . *)
(* Not implemented g_variant_dup_string argument types not handled . *)
(* Not implemented g_variant_dup_strv argument types not handled . *)
(* Not implemented g_variant_equal argument types not handled . *)
val get_boolean:
t structure ptr -> bool
val get_byte:
t structure ptr -> Unsigned.uint8
(* Not implemented g_variant_get_bytestring return type not handled . *)
(* Not implemented g_variant_get_bytestring_array argument types not handled . *)
(* Not implemented g_variant_get_child_value return type not handled . *)
val get_data:
t structure ptr -> unit ptr
(* Not implemented g_variant_get_data_as_bytes return type not handled . *)
val get_double:
t structure ptr -> float
val get_handle:
t structure ptr -> int32
val get_int16:
t structure ptr -> int
val get_int32:
t structure ptr -> int32
val get_int64:
t structure ptr -> int64
(* Not implemented g_variant_get_maybe return type not handled . *)
(* Not implemented g_variant_get_normal_form return type not handled . *)
(* Not implemented g_variant_get_objv argument types not handled . *)
val get_size:
t structure ptr -> Unsigned.uint64
(* Not implemented g_variant_get_string argument types not handled . *)
(* Not implemented g_variant_get_strv argument types not handled . *)
(* Not implemented g_variant_get_type return type not handled . *)
val get_type_string:
t structure ptr -> string
val get_uint16:
t structure ptr -> Unsigned.uint16
val get_uint32:
t structure ptr -> Unsigned.uint32
val get_uint64:
t structure ptr -> Unsigned.uint64
(* Not implemented g_variant_get_variant return type not handled . *)
val hash:
t structure ptr -> Unsigned.uint32
val is_container:
t structure ptr -> bool
val is_floating:
t structure ptr -> bool
val is_normal_form:
t structure ptr -> bool
(* Not implemented g_variant_is_of_type argument types not handled . *)
(* Not implemented g_variant_lookup_value argument types not handled . *)
val n_children:
t structure ptr -> Unsigned.uint64
(* Not implemented g_variant_print return type not handled . *)
(* Not implemented g_variant_ref return type not handled . *)
(* Not implemented g_variant_ref_sink return type not handled . *)
val store:
t structure ptr -> unit ptr -> unit
(* Not implemented g_variant_take_ref return type not handled . *)
val unref:
t structure ptr -> unit
val is_object_path:
t structure ptr -> string -> bool
val is_signature:
t structure ptr -> string -> bool
(* Not implemented g_variant_parse argument types not handled . *)
(* Not implemented g_variant_parse_error_print_context return type not handled . *)
val parse_error_quark:
t structure ptr -> Unsigned.uint32
val parser_get_error_quark:
t structure ptr -> Unsigned.uint32

