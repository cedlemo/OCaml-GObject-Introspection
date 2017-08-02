open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_regex_new argument types not handled . *)
val get_capture_count:
t structure ptr -> int32
(* Not implemented g_regex_get_compile_flags return type not handled . *)
val get_has_cr_or_lf:
t structure ptr -> bool
(* Not implemented g_regex_get_match_flags return type not handled . *)
val get_max_backref:
t structure ptr -> int32
val get_max_lookbehind:
t structure ptr -> int32
val get_pattern:
t structure ptr -> string
val get_string_number:
t structure ptr -> string -> int32
(* Not implemented g_regex_match argument types not handled . *)
(* Not implemented g_regex_match_all argument types not handled . *)
(* Not implemented g_regex_match_all_full argument types not handled . *)
(* Not implemented g_regex_match_full argument types not handled . *)
(* Not implemented g_regex_ref return type not handled . *)
(* Not implemented g_regex_replace argument types not handled . *)
(* Not implemented g_regex_replace_literal argument types not handled . *)
(* Not implemented g_regex_split argument types not handled . *)
(* Not implemented g_regex_split_full argument types not handled . *)
val unref:
t structure ptr -> unit
(* Not implemented g_regex_check_replacement argument types not handled . *)
val error_quark:
t structure ptr -> Unsigned.uint32
(* Not implemented g_regex_escape_nul return type not handled . *)
(* Not implemented g_regex_escape_string argument types not handled . *)
(* Not implemented g_regex_match_simple argument types not handled . *)
(* Not implemented g_regex_split_simple argument types not handled . *)

