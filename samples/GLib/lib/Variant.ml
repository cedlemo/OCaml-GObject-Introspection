open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Variant"
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
let check_format_string =
foreign "g_variant_check_format_string" (ptr t_typ @-> string @-> bool @-> returning (bool))
(* Not implemented g_variant_classify return type not handled . *)
(* Not implemented g_variant_compare argument types not handled . *)
(* Not implemented g_variant_dup_bytestring argument types not handled . *)
(* Not implemented g_variant_dup_bytestring_array argument types not handled . *)
(* Not implemented g_variant_dup_objv argument types not handled . *)
(* Not implemented g_variant_dup_string argument types not handled . *)
(* Not implemented g_variant_dup_strv argument types not handled . *)
(* Not implemented g_variant_equal argument types not handled . *)
let get_boolean =
foreign "g_variant_get_boolean" (ptr t_typ @-> returning (bool))
let get_byte =
foreign "g_variant_get_byte" (ptr t_typ @-> returning (uint8_t))
(* Not implemented g_variant_get_bytestring return type not handled . *)
(* Not implemented g_variant_get_bytestring_array argument types not handled . *)
(* Not implemented g_variant_get_child_value return type not handled . *)
let get_data =
foreign "g_variant_get_data" (ptr t_typ @-> returning (ptr void))
(* Not implemented g_variant_get_data_as_bytes return type not handled . *)
let get_double =
foreign "g_variant_get_double" (ptr t_typ @-> returning (double))
let get_handle =
foreign "g_variant_get_handle" (ptr t_typ @-> returning (int32_t))
let get_int16 =
foreign "g_variant_get_int16" (ptr t_typ @-> returning (int16_t))
let get_int32 =
foreign "g_variant_get_int32" (ptr t_typ @-> returning (int32_t))
let get_int64 =
foreign "g_variant_get_int64" (ptr t_typ @-> returning (int64_t))
(* Not implemented g_variant_get_maybe return type not handled . *)
(* Not implemented g_variant_get_normal_form return type not handled . *)
(* Not implemented g_variant_get_objv argument types not handled . *)
let get_size =
foreign "g_variant_get_size" (ptr t_typ @-> returning (uint64_t))
(* Not implemented g_variant_get_string argument types not handled . *)
(* Not implemented g_variant_get_strv argument types not handled . *)
(* Not implemented g_variant_get_type return type not handled . *)
let get_type_string =
foreign "g_variant_get_type_string" (ptr t_typ @-> returning (string))
let get_uint16 =
foreign "g_variant_get_uint16" (ptr t_typ @-> returning (uint16_t))
let get_uint32 =
foreign "g_variant_get_uint32" (ptr t_typ @-> returning (uint32_t))
let get_uint64 =
foreign "g_variant_get_uint64" (ptr t_typ @-> returning (uint64_t))
(* Not implemented g_variant_get_variant return type not handled . *)
let hash =
foreign "g_variant_hash" (ptr t_typ @-> returning (uint32_t))
let is_container =
foreign "g_variant_is_container" (ptr t_typ @-> returning (bool))
let is_floating =
foreign "g_variant_is_floating" (ptr t_typ @-> returning (bool))
let is_normal_form =
foreign "g_variant_is_normal_form" (ptr t_typ @-> returning (bool))
(* Not implemented g_variant_is_of_type argument types not handled . *)
(* Not implemented g_variant_lookup_value argument types not handled . *)
let n_children =
foreign "g_variant_n_children" (ptr t_typ @-> returning (uint64_t))
(* Not implemented g_variant_print return type not handled . *)
(* Not implemented g_variant_ref return type not handled . *)
(* Not implemented g_variant_ref_sink return type not handled . *)
let store =
foreign "g_variant_store" (ptr t_typ @-> ptr void @-> returning (void))
(* Not implemented g_variant_take_ref return type not handled . *)
let unref =
foreign "g_variant_unref" (ptr t_typ @-> returning (void))
let is_object_path =
foreign "g_variant_is_object_path" (ptr t_typ @-> string @-> returning (bool))
let is_signature =
foreign "g_variant_is_signature" (ptr t_typ @-> string @-> returning (bool))
(* Not implemented g_variant_parse argument types not handled . *)
(* Not implemented g_variant_parse_error_print_context return type not handled . *)
let parse_error_quark =
foreign "g_variant_parse_error_quark" (ptr t_typ @-> returning (uint32_t))
let parser_get_error_quark =
foreign "g_variant_parser_get_error_quark" (ptr t_typ @-> returning (uint32_t))

