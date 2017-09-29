open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Regex"
let _new =
foreign "g_regex_new" (ptr t_typ @-> string @-> Regex_compile_flags.t_list_view @-> Regex_match_flags.t_list_view  @-> ptr_opt (ptr Error.t_typ) @-> returning (ptr_opt t_typ))

let get_capture_count =
foreign "g_regex_get_capture_count" (ptr t_typ @-> returning (int32_t))

let get_compile_flags =
foreign "g_regex_get_compile_flags" (ptr t_typ @-> returning (Regex_compile_flags.t_list_view))

let get_has_cr_or_lf =
foreign "g_regex_get_has_cr_or_lf" (ptr t_typ @-> returning (bool))

let get_match_flags =
foreign "g_regex_get_match_flags" (ptr t_typ @-> returning (Regex_match_flags.t_list_view))

let get_max_backref =
foreign "g_regex_get_max_backref" (ptr t_typ @-> returning (int32_t))

let get_max_lookbehind =
foreign "g_regex_get_max_lookbehind" (ptr t_typ @-> returning (int32_t))

let get_pattern =
foreign "g_regex_get_pattern" (ptr t_typ @-> returning (string))

let get_string_number =
foreign "g_regex_get_string_number" (ptr t_typ @-> string @-> returning (int32_t))

(*Not implemented g_regex_match argument types not handled*)
(*Not implemented g_regex_match_all argument types not handled*)
(*Not implemented g_regex_match_all_full argument types not handled*)
(*Not implemented g_regex_match_full argument types not handled*)
let ref =
foreign "g_regex_ref" (ptr t_typ @-> returning (ptr t_typ))

(*Not implemented g_regex_replace argument types not handled*)
(*Not implemented g_regex_replace_literal argument types not handled*)
(*Not implemented g_regex_split return type not handled*)
(*Not implemented g_regex_split_full argument types not handled*)
let unref =
foreign "g_regex_unref" (ptr t_typ @-> returning (void))

(*Not implemented g_regex_check_replacement argument types not handled*)
let error_quark =
foreign "g_regex_error_quark" (ptr t_typ @-> returning (uint32_t))

let escape_nul =
foreign "g_regex_escape_nul" (ptr t_typ @-> string @-> int32_t @-> returning (string))

(*Not implemented g_regex_escape_string argument types not handled*)
let match_simple =
foreign "g_regex_match_simple" (ptr t_typ @-> string @-> string @-> Regex_compile_flags.t_list_view @-> Regex_match_flags.t_list_view @-> returning (bool))

(*Not implemented g_regex_split_simple return type not handled*)
