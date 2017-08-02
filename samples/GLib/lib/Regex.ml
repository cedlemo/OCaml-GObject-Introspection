open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Regex"
(* Not implemented g_regex_new argument types not handled . *)
let get_capture_count =
foreign "g_regex_get_capture_count" (ptr t_typ @-> returning (int32_t))
(* Not implemented g_regex_get_compile_flags return type not handled . *)
let get_has_cr_or_lf =
foreign "g_regex_get_has_cr_or_lf" (ptr t_typ @-> returning (bool))
(* Not implemented g_regex_get_match_flags return type not handled . *)
let get_max_backref =
foreign "g_regex_get_max_backref" (ptr t_typ @-> returning (int32_t))
let get_max_lookbehind =
foreign "g_regex_get_max_lookbehind" (ptr t_typ @-> returning (int32_t))
let get_pattern =
foreign "g_regex_get_pattern" (ptr t_typ @-> returning (string))
let get_string_number =
foreign "g_regex_get_string_number" (ptr t_typ @-> string @-> returning (int32_t))
(* Not implemented g_regex_match argument types not handled . *)
(* Not implemented g_regex_match_all argument types not handled . *)
(* Not implemented g_regex_match_all_full argument types not handled . *)
(* Not implemented g_regex_match_full argument types not handled . *)
(* Not implemented g_regex_ref return type not handled . *)
(* Not implemented g_regex_replace argument types not handled . *)
(* Not implemented g_regex_replace_literal argument types not handled . *)
(* Not implemented g_regex_split argument types not handled . *)
(* Not implemented g_regex_split_full argument types not handled . *)
let unref =
foreign "g_regex_unref" (ptr t_typ @-> returning (void))
(* Not implemented g_regex_check_replacement argument types not handled . *)
let error_quark =
foreign "g_regex_error_quark" (ptr t_typ @-> returning (uint32_t))
(* Not implemented g_regex_escape_nul return type not handled . *)
(* Not implemented g_regex_escape_string argument types not handled . *)
(* Not implemented g_regex_match_simple argument types not handled . *)
(* Not implemented g_regex_split_simple argument types not handled . *)

