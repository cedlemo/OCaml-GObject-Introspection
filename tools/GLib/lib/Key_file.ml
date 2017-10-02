open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Key_file"
let _new =
foreign "g_key_file_new" (ptr t_typ @-> returning (ptr t_typ))

let get_boolean =
foreign "g_key_file_get_boolean" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

(*Not implemented g_key_file_get_boolean_list argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_comment =
foreign "g_key_file_get_comment" (ptr t_typ @-> string_opt @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (string))

let get_double =
foreign "g_key_file_get_double" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (double))

(*Not implemented g_key_file_get_double_list argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_key_file_get_groups argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_int64 =
foreign "g_key_file_get_int64" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (int64_t))

let get_integer =
foreign "g_key_file_get_integer" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (int32_t))

(*Not implemented g_key_file_get_integer_list argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_key_file_get_keys argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_locale_string =
foreign "g_key_file_get_locale_string" (ptr t_typ @-> string @-> string @-> string_opt  @-> ptr_opt (ptr Error.t_typ) @-> returning (string))

(*Not implemented g_key_file_get_locale_string_list argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_start_group =
foreign "g_key_file_get_start_group" (ptr t_typ @-> returning (string))

let get_string =
foreign "g_key_file_get_string" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (string))

(*Not implemented g_key_file_get_string_list argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_uint64 =
foreign "g_key_file_get_uint64" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (uint64_t))

let get_value =
foreign "g_key_file_get_value" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (string))

let has_group =
foreign "g_key_file_has_group" (ptr t_typ @-> string @-> returning (bool))

let load_from_bytes =
foreign "g_key_file_load_from_bytes" (ptr t_typ @-> ptr Bytes.t_typ @-> Key_file_flags.t_list_view  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let load_from_data =
foreign "g_key_file_load_from_data" (ptr t_typ @-> string @-> uint64_t @-> Key_file_flags.t_list_view  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

(*Not implemented g_key_file_load_from_data_dirs argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_key_file_load_from_dirs argument typeC Array type for Types.Array tag not handled*)
let load_from_file =
foreign "g_key_file_load_from_file" (ptr t_typ @-> string @-> Key_file_flags.t_list_view  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let remove_comment =
foreign "g_key_file_remove_comment" (ptr t_typ @-> string_opt @-> string_opt  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let remove_group =
foreign "g_key_file_remove_group" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let remove_key =
foreign "g_key_file_remove_key" (ptr t_typ @-> string @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let save_to_file =
foreign "g_key_file_save_to_file" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let set_boolean =
foreign "g_key_file_set_boolean" (ptr t_typ @-> string @-> string @-> bool @-> returning (void))

(*Not implemented g_key_file_set_boolean_list argument typeC Array type for Types.Array tag not handled*)
let set_comment =
foreign "g_key_file_set_comment" (ptr t_typ @-> string_opt @-> string_opt @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let set_double =
foreign "g_key_file_set_double" (ptr t_typ @-> string @-> string @-> double @-> returning (void))

(*Not implemented g_key_file_set_double_list argument typeC Array type for Types.Array tag not handled*)
let set_int64 =
foreign "g_key_file_set_int64" (ptr t_typ @-> string @-> string @-> int64_t @-> returning (void))

let set_integer =
foreign "g_key_file_set_integer" (ptr t_typ @-> string @-> string @-> int32_t @-> returning (void))

(*Not implemented g_key_file_set_integer_list argument typeC Array type for Types.Array tag not handled*)
let set_list_separator =
foreign "g_key_file_set_list_separator" (ptr t_typ @-> int8_t @-> returning (void))

let set_locale_string =
foreign "g_key_file_set_locale_string" (ptr t_typ @-> string @-> string @-> string @-> string @-> returning (void))

(*Not implemented g_key_file_set_locale_string_list argument typeC Array type for Types.Array tag not handled*)
let set_string =
foreign "g_key_file_set_string" (ptr t_typ @-> string @-> string @-> string @-> returning (void))

(*Not implemented g_key_file_set_string_list argument typeC Array type for Types.Array tag not handled*)
let set_uint64 =
foreign "g_key_file_set_uint64" (ptr t_typ @-> string @-> string @-> uint64_t @-> returning (void))

let set_value =
foreign "g_key_file_set_value" (ptr t_typ @-> string @-> string @-> string @-> returning (void))

(*Not implemented g_key_file_to_data argument typeArg_info.InOut or Arg_info.Out not handled*)
let unref =
foreign "g_key_file_unref" (ptr t_typ @-> returning (void))

let error_quark =
foreign "g_key_file_error_quark" (ptr t_typ @-> returning (uint32_t))


