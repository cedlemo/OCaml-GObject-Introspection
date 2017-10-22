open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Option_context"
let add_group =
  foreign "g_option_context_add_group" (ptr t_typ @-> ptr Option_group.t_typ @-> returning (void))

let add_main_entries =
  foreign "g_option_context_add_main_entries" (ptr t_typ @-> ptr Option_entry.t_typ @-> string_opt @-> returning (void))

let free =
  foreign "g_option_context_free" (ptr t_typ @-> returning (void))

let get_description =
  foreign "g_option_context_get_description" (ptr t_typ @-> returning (string))

let get_help =
  foreign "g_option_context_get_help" (ptr t_typ @-> bool @-> ptr_opt Option_group.t_typ @-> returning (string))

let get_help_enabled =
  foreign "g_option_context_get_help_enabled" (ptr t_typ @-> returning (bool))

let get_ignore_unknown_options =
  foreign "g_option_context_get_ignore_unknown_options" (ptr t_typ @-> returning (bool))

let get_main_group =
  foreign "g_option_context_get_main_group" (ptr t_typ @-> returning (ptr Option_group.t_typ))

let get_strict_posix =
  foreign "g_option_context_get_strict_posix" (ptr t_typ @-> returning (bool))

let get_summary =
  foreign "g_option_context_get_summary" (ptr t_typ @-> returning (string))

(*Not implemented g_option_context_parse argument typeArg_info.InOut or Arg_info.Out not handled*)
(*Not implemented g_option_context_parse_strv argument typeArg_info.InOut or Arg_info.Out not handled*)
let set_description =
  foreign "g_option_context_set_description" (ptr t_typ @-> string_opt @-> returning (void))

let set_help_enabled =
  foreign "g_option_context_set_help_enabled" (ptr t_typ @-> bool @-> returning (void))

let set_ignore_unknown_options =
  foreign "g_option_context_set_ignore_unknown_options" (ptr t_typ @-> bool @-> returning (void))

let set_main_group =
  foreign "g_option_context_set_main_group" (ptr t_typ @-> ptr Option_group.t_typ @-> returning (void))

let set_strict_posix =
  foreign "g_option_context_set_strict_posix" (ptr t_typ @-> bool @-> returning (void))

let set_summary =
  foreign "g_option_context_set_summary" (ptr t_typ @-> string_opt @-> returning (void))

(*Not implemented g_option_context_set_translate_func argument typecallback not handled*)
let set_translation_domain =
  foreign "g_option_context_set_translation_domain" (ptr t_typ @-> string @-> returning (void))


