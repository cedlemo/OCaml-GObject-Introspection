open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Match_info"
let expand_references =
  foreign "g_match_info_expand_references" (ptr t_typ @-> string  @-> ptr_opt (ptr Error.t_typ) @-> returning (string_opt))

let fetch =
  foreign "g_match_info_fetch" (ptr t_typ @-> int32_t @-> returning (string_opt))

(*Not implemented g_match_info_fetch_all return type C Array type for Types.Array tag not handled*)
let fetch_named =
  foreign "g_match_info_fetch_named" (ptr t_typ @-> string @-> returning (string_opt))

(*Not implemented g_match_info_fetch_named_pos argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_match_info_fetch_pos argument typeArg_info.InOut or Arg_info.Out not handled*)
let free =
  foreign "g_match_info_free" (ptr t_typ @-> returning (void))

let get_match_count =
  foreign "g_match_info_get_match_count" (ptr t_typ @-> returning (int32_t))

let get_regex =
  foreign "g_match_info_get_regex" (ptr t_typ @-> returning (ptr Regex.t_typ))

let get_string =
  foreign "g_match_info_get_string" (ptr t_typ @-> returning (string))

let is_partial_match =
  foreign "g_match_info_is_partial_match" (ptr t_typ @-> returning (bool))

let matches =
  foreign "g_match_info_matches" (ptr t_typ @-> returning (bool))

let next =
  foreign "g_match_info_next" (ptr t_typ  @-> ptr_opt (ptr Error.t_typ) @-> returning (bool))

let ref =
  foreign "g_match_info_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_match_info_unref" (ptr t_typ @-> returning (void))


