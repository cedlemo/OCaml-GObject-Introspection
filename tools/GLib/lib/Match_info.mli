open Ctypes

type t
val t_typ : t structure typ
val expand_references:
  t structure ptr -> string -> (string option, Error.t structure ptr option) result

val fetch:
  t structure ptr -> int32 -> string option

(*Not implemented g_match_info_fetch_all return type C Array type for Types.Array tag not handled*)
val fetch_named:
  t structure ptr -> string -> string option

(*Not implemented g_match_info_fetch_named_pos argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_match_info_fetch_pos argument typeArg_info.InOut or Arg_info.Out not handled*)
val free:
  t structure ptr -> unit

val get_match_count:
  t structure ptr -> int32

val get_regex:
  t structure ptr -> Regex.t structure ptr

val get_string:
  t structure ptr -> string

val is_partial_match:
  t structure ptr -> bool

val matches:
  t structure ptr -> bool

val next:
  t structure ptr -> (bool, Error.t structure ptr option) result

val ref:
  t structure ptr -> t structure ptr

val unref:
  t structure ptr -> unit


