open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_option_group_new argument types not handled . *)
(* Not implemented g_option_group_add_entries argument types not handled . *)
val free:
t structure ptr -> unit
(* Not implemented g_option_group_ref return type not handled . *)
(* Not implemented g_option_group_set_translate_func argument types not handled . *)
val set_translation_domain:
t structure ptr -> string -> unit
val unref:
t structure ptr -> unit

