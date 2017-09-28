open Ctypes

type t
val t_typ : t structure typ
(*Not implemented g_variant_new_array argument types not handled*)
val new_boolean:
t structure ptr -> bool -> t structure ptr

val new_byte:
t structure ptr -> Unsigned.uint8 -> t structure ptr

(*Not implemented g_variant_new_bytestring argument types not handled*)
(*Not implemented g_variant_new_bytestring_array argument types not handled*)
val new_dict_entry:
t structure ptr -> t structure ptr -> t structure ptr -> t structure ptr

val new_double:
t structure ptr -> float -> t structure ptr

val new_fixed_array:
t structure ptr -> Variant_type.t structure ptr -> unit ptr option -> Unsigned.uint64 -> Unsigned.uint64 -> t structure ptr

val new_from_bytes:
t structure ptr -> Variant_type.t structure ptr -> Bytes.t structure ptr -> bool -> t structure ptr

(*Not implemented g_variant_new_from_data argument types not handled*)
val new_handle:
t structure ptr -> int32 -> t structure ptr

val new_int16:
t structure ptr -> int -> t structure ptr

val new_int32:
t structure ptr -> int32 -> t structure ptr

val new_int64:
t structure ptr -> int64 -> t structure ptr

val new_maybe:
t structure ptr -> Variant_type.t structure ptr option -> t structure ptr option -> t structure ptr

val new_object_path:
t structure ptr -> string -> t structure ptr

(*Not implemented g_variant_new_objv argument types not handled*)
val new_signature:
t structure ptr -> string -> t structure ptr

val new_string:
t structure ptr -> string -> t structure ptr

(*Not implemented g_variant_new_strv argument types not handled*)
(*Not implemented g_variant_new_tuple argument types not handled*)
val new_uint16:
t structure ptr -> Unsigned.uint16 -> t structure ptr

val new_uint32:
t structure ptr -> Unsigned.uint32 -> t structure ptr

val new_uint64:
t structure ptr -> Unsigned.uint64 -> t structure ptr

val new_variant:
t structure ptr -> t structure ptr -> t structure ptr

val byteswap:
t structure ptr -> t structure ptr

val check_format_string:
t structure ptr -> string -> bool -> bool

val classify:
t structure ptr -> Variant_class.t

val compare:
t structure ptr -> t structure ptr -> int32

(*Not implemented g_variant_dup_bytestring argument types not handled*)
(*Not implemented g_variant_dup_bytestring_array argument types not handled*)
(*Not implemented g_variant_dup_objv argument types not handled*)
(*Not implemented g_variant_dup_string argument types not handled*)
(*Not implemented g_variant_dup_strv argument types not handled*)
val equal:
t structure ptr -> t structure ptr -> bool

val get_boolean:
t structure ptr -> bool

val get_byte:
t structure ptr -> Unsigned.uint8

(*Not implemented g_variant_get_bytestring return type not handled*)
(*Not implemented g_variant_get_bytestring_array argument types not handled*)
val get_child_value:
t structure ptr -> Unsigned.uint64 -> t structure ptr

val get_data:
t structure ptr -> unit ptr option

val get_data_as_bytes:
t structure ptr -> Bytes.t structure ptr

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

val get_maybe:
t structure ptr -> t structure ptr option

val get_normal_form:
t structure ptr -> t structure ptr

(*Not implemented g_variant_get_objv argument types not handled*)
val get_size:
t structure ptr -> Unsigned.uint64

(*Not implemented g_variant_get_string argument types not handled*)
(*Not implemented g_variant_get_strv argument types not handled*)
val get_type:
t structure ptr -> Variant_type.t structure ptr

val get_type_string:
t structure ptr -> string

val get_uint16:
t structure ptr -> Unsigned.uint16

val get_uint32:
t structure ptr -> Unsigned.uint32

val get_uint64:
t structure ptr -> Unsigned.uint64

val get_variant:
t structure ptr -> t structure ptr

val hash:
t structure ptr -> Unsigned.uint32

val is_container:
t structure ptr -> bool

val is_floating:
t structure ptr -> bool

val is_normal_form:
t structure ptr -> bool

val is_of_type:
t structure ptr -> Variant_type.t structure ptr -> bool

val lookup_value:
t structure ptr -> string -> Variant_type.t structure ptr option -> t structure ptr

val n_children:
t structure ptr -> Unsigned.uint64

val print:
t structure ptr -> bool -> string

val ref:
t structure ptr -> t structure ptr

val ref_sink:
t structure ptr -> t structure ptr

val store:
t structure ptr -> unit ptr -> unit

val take_ref:
t structure ptr -> t structure ptr

val unref:
t structure ptr -> unit

val is_object_path:
t structure ptr -> string -> bool

val is_signature:
t structure ptr -> string -> bool

val parse:
t structure ptr -> Variant_type.t structure ptr option -> string -> string option -> string option -> Error.t structure ptr ptr option -> t structure ptr

val parse_error_print_context:
t structure ptr -> Error.t structure ptr -> string -> string

val parse_error_quark:
t structure ptr -> Unsigned.uint32

val parser_get_error_quark:
t structure ptr -> Unsigned.uint32


