open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_option_context_add_group argument types not handled . *)
(* Not implemented g_option_context_add_main_entries argument types not handled . *)
val free:
t structure ptr -> unit
val get_description:
t structure ptr -> string
(* Not implemented g_option_context_get_help argument types not handled . *)
val get_help_enabled:
t structure ptr -> bool
val get_ignore_unknown_options:
t structure ptr -> bool
(* Not implemented g_option_context_get_main_group return type not handled . *)
val get_strict_posix:
t structure ptr -> bool
val get_summary:
t structure ptr -> string
(* Not implemented g_option_context_parse argument types not handled . *)
(* Not implemented g_option_context_parse_strv argument types not handled . *)
val set_description:
t structure ptr -> string -> unit
val set_help_enabled:
t structure ptr -> bool -> unit
val set_ignore_unknown_options:
t structure ptr -> bool -> unit
(* Not implemented g_option_context_set_main_group argument types not handled . *)
val set_strict_posix:
t structure ptr -> bool -> unit
val set_summary:
t structure ptr -> string -> unit
(* Not implemented g_option_context_set_translate_func argument types not handled . *)
val set_translation_domain:
t structure ptr -> string -> unit

