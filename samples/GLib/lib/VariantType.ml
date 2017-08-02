open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "VariantType"
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
let free =
foreign "g_variant_type_free" (ptr t_typ @-> returning (void))
let get_string_length =
foreign "g_variant_type_get_string_length" (ptr t_typ @-> returning (uint64_t))
let hash =
foreign "g_variant_type_hash" (ptr t_typ @-> returning (uint32_t))
let is_array =
foreign "g_variant_type_is_array" (ptr t_typ @-> returning (bool))
let is_basic =
foreign "g_variant_type_is_basic" (ptr t_typ @-> returning (bool))
let is_container =
foreign "g_variant_type_is_container" (ptr t_typ @-> returning (bool))
let is_definite =
foreign "g_variant_type_is_definite" (ptr t_typ @-> returning (bool))
let is_dict_entry =
foreign "g_variant_type_is_dict_entry" (ptr t_typ @-> returning (bool))
let is_maybe =
foreign "g_variant_type_is_maybe" (ptr t_typ @-> returning (bool))
(* Not implemented g_variant_type_is_subtype_of argument types not handled . *)
let is_tuple =
foreign "g_variant_type_is_tuple" (ptr t_typ @-> returning (bool))
let is_variant =
foreign "g_variant_type_is_variant" (ptr t_typ @-> returning (bool))
(* Not implemented g_variant_type_key return type not handled . *)
let n_items =
foreign "g_variant_type_n_items" (ptr t_typ @-> returning (uint64_t))
(* Not implemented g_variant_type_next return type not handled . *)
(* Not implemented g_variant_type_value return type not handled . *)
(* Not implemented g_variant_type_checked_ return type not handled . *)
let string_is_valid =
foreign "g_variant_type_string_is_valid" (ptr t_typ @-> string @-> returning (bool))
(* Not implemented g_variant_type_string_scan argument types not handled . *)

