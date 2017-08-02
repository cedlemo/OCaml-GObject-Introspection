open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "OptionGroup"
(* Not implemented g_option_group_new argument types not handled . *)
(* Not implemented g_option_group_add_entries argument types not handled . *)
let free =
foreign "g_option_group_free" (ptr t_typ @-> returning (void))
(* Not implemented g_option_group_ref return type not handled . *)
(* Not implemented g_option_group_set_translate_func argument types not handled . *)
let set_translation_domain =
foreign "g_option_group_set_translation_domain" (ptr t_typ @-> string @-> returning (void))
let unref =
foreign "g_option_group_unref" (ptr t_typ @-> returning (void))

