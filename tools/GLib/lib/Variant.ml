open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Variant"
(*Not implemented g_variant_new_array argument typeC Array type for Types.Array tag not handled*)
let new_boolean =
  foreign "g_variant_new_boolean" (bool @-> returning (ptr t_typ))

let new_byte =
  foreign "g_variant_new_byte" (uint8_t @-> returning (ptr t_typ))

(*Not implemented g_variant_new_bytestring argument typeC Array type for Types.Array tag not handled*)
(*Not implemented g_variant_new_bytestring_array argument typeC Array type for Types.Array tag not handled*)
let new_dict_entry =
  foreign "g_variant_new_dict_entry" (ptr t_typ @-> ptr t_typ @-> returning (ptr t_typ))

let new_double =
  foreign "g_variant_new_double" (double @-> returning (ptr t_typ))

let new_fixed_array =
  foreign "g_variant_new_fixed_array" (ptr Variant_type.t_typ @-> ptr_opt void @-> uint64_t @-> uint64_t @-> returning (ptr t_typ))

(*SKIPPED : g_variant_new_from_bytes argument type Bytes.t structure ptr*)
(*Not implemented g_variant_new_from_data argument typeC Array type for Types.Array tag not handled*)
let new_handle =
  foreign "g_variant_new_handle" (int32_t @-> returning (ptr t_typ))

let new_int16 =
  foreign "g_variant_new_int16" (int16_t @-> returning (ptr t_typ))

let new_int32 =
  foreign "g_variant_new_int32" (int32_t @-> returning (ptr t_typ))

let new_int64 =
  foreign "g_variant_new_int64" (int64_t @-> returning (ptr t_typ))

let new_maybe =
  foreign "g_variant_new_maybe" (ptr_opt Variant_type.t_typ @-> ptr_opt t_typ @-> returning (ptr t_typ))

let new_object_path =
  foreign "g_variant_new_object_path" (string @-> returning (ptr t_typ))

(*Not implemented g_variant_new_objv argument typeC Array type for Types.Array tag not handled*)
let new_signature =
  foreign "g_variant_new_signature" (string @-> returning (ptr t_typ))

let new_string =
  foreign "g_variant_new_string" (string @-> returning (ptr t_typ))

(*Not implemented g_variant_new_strv argument typeC Array type for Types.Array tag not handled*)
(*Not implemented g_variant_new_tuple argument typeC Array type for Types.Array tag not handled*)
let new_uint16 =
  foreign "g_variant_new_uint16" (uint16_t @-> returning (ptr t_typ))

let new_uint32 =
  foreign "g_variant_new_uint32" (uint32_t @-> returning (ptr t_typ))

let new_uint64 =
  foreign "g_variant_new_uint64" (uint64_t @-> returning (ptr t_typ))

let new_variant =
  foreign "g_variant_new_variant" (ptr t_typ @-> returning (ptr t_typ))

let byteswap =
  foreign "g_variant_byteswap" (ptr t_typ @-> returning (ptr t_typ))

let check_format_string =
  foreign "g_variant_check_format_string" (ptr t_typ @-> string @-> bool @-> returning (bool))

let classify =
  foreign "g_variant_classify" (ptr t_typ @-> returning (Variant_class.t_view))

let compare =
  foreign "g_variant_compare" (ptr t_typ @-> ptr t_typ @-> returning (int32_t))

(*Not implemented g_variant_dup_bytestring argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_variant_dup_bytestring_array argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_variant_dup_objv argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_variant_dup_string argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_variant_dup_strv argument typeArg_info.InOut or Arg_info.Out not handled*)
let equal =
  foreign "g_variant_equal" (ptr t_typ @-> ptr t_typ @-> returning (bool))

let get_boolean =
  foreign "g_variant_get_boolean" (ptr t_typ @-> returning (bool))

let get_byte =
  foreign "g_variant_get_byte" (ptr t_typ @-> returning (uint8_t))

(*Not implemented g_variant_get_bytestring return type C Array type for Types.Array tag not handled*)
(*Not implemented g_variant_get_bytestring_array argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_child_value =
  foreign "g_variant_get_child_value" (ptr t_typ @-> uint64_t @-> returning (ptr t_typ))

let get_data =
  foreign "g_variant_get_data" (ptr t_typ @-> returning (ptr_opt void))

(*SKIPPED : g_variant_get_data_as_bytes return type Bytes.t structure ptr*)
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

let get_maybe =
  foreign "g_variant_get_maybe" (ptr t_typ @-> returning (ptr_opt t_typ))

let get_normal_form =
  foreign "g_variant_get_normal_form" (ptr t_typ @-> returning (ptr t_typ))

(*Not implemented g_variant_get_objv argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_size =
  foreign "g_variant_get_size" (ptr t_typ @-> returning (uint64_t))

(*Not implemented g_variant_get_string argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_variant_get_strv argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_type =
  foreign "g_variant_get_type" (ptr t_typ @-> returning (ptr Variant_type.t_typ))

let get_type_string =
  foreign "g_variant_get_type_string" (ptr t_typ @-> returning (string))

let get_uint16 =
  foreign "g_variant_get_uint16" (ptr t_typ @-> returning (uint16_t))

let get_uint32 =
  foreign "g_variant_get_uint32" (ptr t_typ @-> returning (uint32_t))

let get_uint64 =
  foreign "g_variant_get_uint64" (ptr t_typ @-> returning (uint64_t))

let get_variant =
  foreign "g_variant_get_variant" (ptr t_typ @-> returning (ptr t_typ))

let hash =
  foreign "g_variant_hash" (ptr t_typ @-> returning (uint32_t))

let is_container =
  foreign "g_variant_is_container" (ptr t_typ @-> returning (bool))

let is_floating =
  foreign "g_variant_is_floating" (ptr t_typ @-> returning (bool))

let is_normal_form =
  foreign "g_variant_is_normal_form" (ptr t_typ @-> returning (bool))

let is_of_type =
  foreign "g_variant_is_of_type" (ptr t_typ @-> ptr Variant_type.t_typ @-> returning (bool))

let lookup_value =
  foreign "g_variant_lookup_value" (ptr t_typ @-> string @-> ptr_opt Variant_type.t_typ @-> returning (ptr t_typ))

let n_children =
  foreign "g_variant_n_children" (ptr t_typ @-> returning (uint64_t))

let print =
  foreign "g_variant_print" (ptr t_typ @-> bool @-> returning (string))

let ref =
  foreign "g_variant_ref" (ptr t_typ @-> returning (ptr t_typ))

let ref_sink =
  foreign "g_variant_ref_sink" (ptr t_typ @-> returning (ptr t_typ))

let store =
  foreign "g_variant_store" (ptr t_typ @-> ptr void @-> returning (void))

let take_ref =
  foreign "g_variant_take_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_variant_unref" (ptr t_typ @-> returning (void))

let is_object_path =
  foreign "g_variant_is_object_path" (string @-> returning (bool))

let is_signature =
  foreign "g_variant_is_signature" (string @-> returning (bool))

let parse arg1 arg2 arg3 arg4 =
let parse_raw =
  foreign "g_variant_parse" (ptr_opt Variant_type.t_typ @-> string @-> string_opt @-> string_opt @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (ptr t_typ))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = parse_raw arg1 arg2 arg3 arg4 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise (function
| Some e -> Error.free e
| None -> () ) err_ptr
in
Error (err_ptr)

let parse_error_print_context =
  foreign "g_variant_parse_error_print_context" (ptr Error.t_typ @-> string @-> returning (string))

let parse_error_quark =
  foreign "g_variant_parse_error_quark" (void @-> returning (uint32_t))

let parser_get_error_quark =
  foreign "g_variant_parser_get_error_quark" (void @-> returning (uint32_t))


