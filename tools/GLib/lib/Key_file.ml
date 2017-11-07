open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Key_file"
let _new =
  foreign "g_key_file_new" (ptr t_typ @-> returning (ptr t_typ))

let get_boolean arg1 arg2 arg3 =
let get_boolean_raw =
  foreign "g_key_file_get_boolean" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = get_boolean_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

(*Not implemented g_key_file_get_boolean_list argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_comment arg1 arg2 arg3 =
let get_comment_raw =
  foreign "g_key_file_get_comment" (ptr t_typ @-> string_opt @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = get_comment_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

let get_double arg1 arg2 arg3 =
let get_double_raw =
  foreign "g_key_file_get_double" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (double))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = get_double_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

(*Not implemented g_key_file_get_double_list argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_key_file_get_groups argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_int64 arg1 arg2 arg3 =
let get_int64_raw =
  foreign "g_key_file_get_int64" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (int64_t))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = get_int64_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

let get_integer arg1 arg2 arg3 =
let get_integer_raw =
  foreign "g_key_file_get_integer" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (int32_t))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = get_integer_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

(*Not implemented g_key_file_get_integer_list argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_key_file_get_keys argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_locale_string arg1 arg2 arg3 arg4 =
let get_locale_string_raw =
  foreign "g_key_file_get_locale_string" (ptr t_typ @-> string @-> string @-> string_opt @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = get_locale_string_raw arg1 arg2 arg3 arg4 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

(*Not implemented g_key_file_get_locale_string_list argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_start_group =
  foreign "g_key_file_get_start_group" (ptr t_typ @-> returning (string))

let get_string arg1 arg2 arg3 =
let get_string_raw =
  foreign "g_key_file_get_string" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = get_string_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

(*Not implemented g_key_file_get_string_list argument typeArg_info.InOut or Arg_info.Out not handled*)
let get_uint64 arg1 arg2 arg3 =
let get_uint64_raw =
  foreign "g_key_file_get_uint64" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (uint64_t))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = get_uint64_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

let get_value arg1 arg2 arg3 =
let get_value_raw =
  foreign "g_key_file_get_value" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (string_opt))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = get_value_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

let has_group =
  foreign "g_key_file_has_group" (ptr t_typ @-> string @-> returning (bool))

(*SKIPPED : g_key_file_load_from_bytes argument type Bytes.t structure ptr*)
let load_from_data arg1 arg2 arg3 arg4 =
let load_from_data_raw =
  foreign "g_key_file_load_from_data" (ptr t_typ @-> string @-> uint64_t @-> Key_file_flags.t_list_view @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = load_from_data_raw arg1 arg2 arg3 arg4 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

(*Not implemented g_key_file_load_from_data_dirs argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_key_file_load_from_dirs argument typeC Array type for Types.Array tag not handled*)
let load_from_file arg1 arg2 arg3 =
let load_from_file_raw =
  foreign "g_key_file_load_from_file" (ptr t_typ @-> string @-> Key_file_flags.t_list_view @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = load_from_file_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

let remove_comment arg1 arg2 arg3 =
let remove_comment_raw =
  foreign "g_key_file_remove_comment" (ptr t_typ @-> string_opt @-> string_opt @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = remove_comment_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

let remove_group arg1 arg2 =
let remove_group_raw =
  foreign "g_key_file_remove_group" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = remove_group_raw arg1 arg2 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

let remove_key arg1 arg2 arg3 =
let remove_key_raw =
  foreign "g_key_file_remove_key" (ptr t_typ @-> string @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = remove_key_raw arg1 arg2 arg3 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

let save_to_file arg1 arg2 =
let save_to_file_raw =
  foreign "g_key_file_save_to_file" (ptr t_typ @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = save_to_file_raw arg1 arg2 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

let set_boolean =
  foreign "g_key_file_set_boolean" (ptr t_typ @-> string @-> string @-> bool @-> returning (void))

(*Not implemented g_key_file_set_boolean_list argument typeC Array type for Types.Array tag not handled*)
let set_comment arg1 arg2 arg3 arg4 =
let set_comment_raw =
  foreign "g_key_file_set_comment" (ptr t_typ @-> string_opt @-> string_opt @-> string @-> ptr_opt (ptr_opt Error.t_typ) @-> returning (bool))
in
let err_ptr_ptr = allocate (ptr_opt Error.t_typ) None in
let value = set_comment_raw arg1 arg2 arg3 arg4 (Some err_ptr_ptr)
in
match (!@ err_ptr_ptr) with
| None -> Ok value
| Some _ -> let err_ptr = !@ err_ptr_ptr in
let _ = Gc.finalise Error.free in
Error (err_ptr)

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


