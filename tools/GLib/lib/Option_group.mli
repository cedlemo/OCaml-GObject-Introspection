open Ctypes

type t
val t_typ : t structure typ
(*Not implemented g_option_group_new argument types not handled*)
val add_entries:
t structure ptr -> Option_entry.t structure ptr -> unit

val free:
t structure ptr -> unit

val ref:
t structure ptr -> t structure ptr

(*Not implemented g_option_group_set_translate_func argument types not handled*)
val set_translation_domain:
t structure ptr -> string -> unit

val unref:
t structure ptr -> unit


