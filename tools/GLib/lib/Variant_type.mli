open Ctypes

type t
val t_typ : t structure typ

val create:
  string -> t structure ptr
val new_array:
  Variant_type.t structure ptr -> t structure ptr
val new_dict_entry:
  Variant_type.t structure ptr -> Variant_type.t structure ptr -> t structure ptr
val new_maybe:
  Variant_type.t structure ptr -> t structure ptr
(*Not implemented g_variant_type_new_tuple type C Array type for Types.Array tag not implemented*)
val copy:
  t structure ptr -> t structure ptr
val dup_string:
  t structure ptr -> string
val element:
  t structure ptr -> t structure ptr
val equal:
  t structure ptr -> Variant_type.t structure ptr -> bool
val first:
  t structure ptr -> t structure ptr
val free:
  t structure ptr -> unit
val get_string_length:
  t structure ptr -> Unsigned.uint64
val hash:
  t structure ptr -> Unsigned.uint32
val is_array:
  t structure ptr -> bool
val is_basic:
  t structure ptr -> bool
val is_container:
  t structure ptr -> bool
val is_definite:
  t structure ptr -> bool
val is_dict_entry:
  t structure ptr -> bool
val is_maybe:
  t structure ptr -> bool
val is_subtype_of:
  t structure ptr -> Variant_type.t structure ptr -> bool
val is_tuple:
  t structure ptr -> bool
val is_variant:
  t structure ptr -> bool
val key:
  t structure ptr -> t structure ptr
val n_items:
  t structure ptr -> Unsigned.uint64
val next:
  t structure ptr -> t structure ptr
val value:
  t structure ptr -> t structure ptr
val checked_:
  string -> t structure ptr
val string_is_valid:
  string -> bool
(* Not implemented g_variant_type_string_scan - out argument not handled
string -> string option -> (bool, string)
*)
