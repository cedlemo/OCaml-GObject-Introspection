open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Variant_type"
let create =
  foreign "g_variant_type_new" (string @-> returning (ptr t_typ))

let new_array =
  foreign "g_variant_type_new_array" (ptr t_typ @-> returning (ptr t_typ))

let new_dict_entry =
  foreign "g_variant_type_new_dict_entry" (ptr t_typ @-> ptr t_typ @-> returning (ptr t_typ))

let new_maybe =
  foreign "g_variant_type_new_maybe" (ptr t_typ @-> returning (ptr t_typ))

(*Not implemented g_variant_type_new_tuple argument typeC Array type for Types.Array tag not handled*)
let copy =
  foreign "g_variant_type_copy" (ptr t_typ @-> returning (ptr t_typ))

let dup_string =
  foreign "g_variant_type_dup_string" (ptr t_typ @-> returning (string))

let element =
  foreign "g_variant_type_element" (ptr t_typ @-> returning (ptr t_typ))

let equal =
  foreign "g_variant_type_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))

let first =
  foreign "g_variant_type_first" (ptr t_typ @-> returning (ptr t_typ))

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

let is_subtype_of =
  foreign "g_variant_type_is_subtype_of" (ptr t_typ @-> ptr t_typ @-> returning (bool))

let is_tuple =
  foreign "g_variant_type_is_tuple" (ptr t_typ @-> returning (bool))

let is_variant =
  foreign "g_variant_type_is_variant" (ptr t_typ @-> returning (bool))

let key =
  foreign "g_variant_type_key" (ptr t_typ @-> returning (ptr t_typ))

let n_items =
  foreign "g_variant_type_n_items" (ptr t_typ @-> returning (uint64_t))

let next =
  foreign "g_variant_type_next" (ptr t_typ @-> returning (ptr t_typ))

let value =
  foreign "g_variant_type_value" (ptr t_typ @-> returning (ptr t_typ))

let checked_ =
  foreign "g_variant_type_checked_" (string @-> returning (ptr t_typ))

let string_is_valid =
  foreign "g_variant_type_string_is_valid" (string @-> returning (bool))

(*Not implemented g_variant_type_string_scan argument typeArg_info.InOut or Arg_info.Out not handled*)

