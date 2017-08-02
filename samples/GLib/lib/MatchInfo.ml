open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "MatchInfo"
(* Not implemented g_match_info_expand_references return type not handled . *)
(* Not implemented g_match_info_fetch return type not handled . *)
(* Not implemented g_match_info_fetch_all return type not handled . *)
(* Not implemented g_match_info_fetch_named return type not handled . *)
(* Not implemented g_match_info_fetch_named_pos argument types not handled . *)
(* Not implemented g_match_info_fetch_pos argument types not handled . *)
let free =
foreign "g_match_info_free" (ptr t_typ @-> returning (void))
let get_match_count =
foreign "g_match_info_get_match_count" (ptr t_typ @-> returning (int32_t))
(* Not implemented g_match_info_get_regex return type not handled . *)
let get_string =
foreign "g_match_info_get_string" (ptr t_typ @-> returning (string))
let is_partial_match =
foreign "g_match_info_is_partial_match" (ptr t_typ @-> returning (bool))
let matches =
foreign "g_match_info_matches" (ptr t_typ @-> returning (bool))
let next =
foreign "g_match_info_next" (ptr t_typ @-> returning (bool))
(* Not implemented g_match_info_ref return type not handled . *)
let unref =
foreign "g_match_info_unref" (ptr t_typ @-> returning (void))

