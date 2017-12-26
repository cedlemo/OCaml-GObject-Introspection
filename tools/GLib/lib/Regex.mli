open Ctypes

type t
val t_typ : t structure typ

val create:
  string -> Regex_compile_flags.t_list -> Regex_match_flags.t_list -> (t structure ptr option, Error.t structure ptr option) result
val get_capture_count:
  t structure ptr -> int32
val get_compile_flags:
  t structure ptr -> Regex_compile_flags.t_list
val get_has_cr_or_lf:
  t structure ptr -> bool
val get_match_flags:
  t structure ptr -> Regex_match_flags.t_list
val get_max_backref:
  t structure ptr -> int32
val get_max_lookbehind:
  t structure ptr -> int32
val get_pattern:
  t structure ptr -> string
val get_string_number:
  t structure ptr -> string -> int32
(* Not implemented g_regex_match - out argument not handled
t structure ptr -> string -> Regex_match_flags.t_list -> (bool, Match_info.t structure ptr)
*)
(* Not implemented g_regex_match_all - out argument not handled
t structure ptr -> string -> Regex_match_flags.t_list -> (bool, Match_info.t structure ptr)
*)
(*Not implemented g_regex_match_all_full type C Array type for Types.Array tag not implemented*)
(*Not implemented g_regex_match_full type C Array type for Types.Array tag not implemented*)
val ref:
  t structure ptr -> t structure ptr
(*Not implemented g_regex_replace type C Array type for Types.Array tag not implemented*)
(*Not implemented g_regex_replace_literal type C Array type for Types.Array tag not implemented*)
(*Not implemented g_regex_split return type C Array type for Types.Array tag not handled*)
(*Not implemented g_regex_split_full type C Array type for Types.Array tag not implemented*)
val unref:
  t structure ptr -> unit
(* Not implemented g_regex_check_replacement - out argument not handled
string -> (bool, bool)
*)
val error_quark:
  unit -> Unsigned.uint32
val escape_nul:
  string -> int32 -> string
(*Not implemented g_regex_escape_string type C Array type for Types.Array tag not implemented*)
val match_simple:
  string -> string -> Regex_compile_flags.t_list -> Regex_match_flags.t_list -> bool
(*Not implemented g_regex_split_simple return type C Array type for Types.Array tag not handled*)
