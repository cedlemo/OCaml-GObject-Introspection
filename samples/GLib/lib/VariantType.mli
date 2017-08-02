open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_variant_type_new return type not handled . *)
(* Not implemented g_variant_type_new_array argument types not handled . *)
(* Not implemented g_variant_type_new_dict_entry argument types not handled . *)
(* Not implemented g_variant_type_new_maybe argument types not handled . *)
(* Not implemented g_variant_type_new_tuple argument types not handled . *)
(* Not implemented g_variant_type_copy return type not handled . *)
(* Not implemented g_variant_type_dup_string return type not handled . *)
(* Not implemented g_variant_type_element return type not handled . *)
(* Not implemented g_variant_type_equal argument types not handled . *)
(* Not implemented g_variant_type_first return type not handled . *)
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
(* Not implemented g_variant_type_is_subtype_of argument types not handled . *)
val is_tuple:
t structure ptr -> bool
val is_variant:
t structure ptr -> bool
(* Not implemented g_variant_type_key return type not handled . *)
val n_items:
t structure ptr -> Unsigned.uint64
(* Not implemented g_variant_type_next return type not handled . *)
(* Not implemented g_variant_type_value return type not handled . *)
(* Not implemented g_variant_type_checked_ return type not handled . *)
val string_is_valid:
t structure ptr -> string -> bool
(* Not implemented g_variant_type_string_scan argument types not handled . *)

