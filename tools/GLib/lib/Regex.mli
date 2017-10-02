open Ctypes

type t
val t_typ : t structure typ
val _new:
t structure ptr -> string -> Regex_compile_flags.t_list -> Regex_match_flags.t_list -> Error.t structure ptr ptr option -> t structure ptr option

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

(*Not implemented g_regex_match argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_regex_match_all argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_regex_match_all_full argument typeC Array type for Types.Array tag not handled*)
(*Not implemented g_regex_match_full argument typeC Array type for Types.Array tag not handled*)
val ref:
t structure ptr -> t structure ptr

(*Not implemented g_regex_replace argument typeC Array type for Types.Array tag not handled*)
(*Not implemented g_regex_replace_literal argument typeC Array type for Types.Array tag not handled*)
(*Not implemented g_regex_split return type C Array type for Types.Array tag not handled*)
(*Not implemented g_regex_split_full argument typeC Array type for Types.Array tag not handled*)
val unref:
t structure ptr -> unit

(*Not implemented g_regex_check_replacement argument typeArg_info.InOut or Arg_info.Out not handled*)
val error_quark:
t structure ptr -> Unsigned.uint32

val escape_nul:
t structure ptr -> string -> int32 -> string

(*Not implemented g_regex_escape_string argument typeC Array type for Types.Array tag not handled*)
val match_simple:
t structure ptr -> string -> string -> Regex_compile_flags.t_list -> Regex_match_flags.t_list -> bool

(*Not implemented g_regex_split_simple return type C Array type for Types.Array tag not handled*)

