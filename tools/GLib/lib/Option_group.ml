open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Option_group"

(*Not implemented g_option_group_new type callback not implemented*)
let add_entries =
  foreign "g_option_group_add_entries" (ptr t_typ @-> ptr Option_entry.t_typ @-> returning (void))
let free =
  foreign "g_option_group_free" (ptr t_typ @-> returning (void))
let ref =
  foreign "g_option_group_ref" (ptr t_typ @-> returning (ptr t_typ))
(*Not implemented g_option_group_set_translate_func type callback not implemented*)
let set_translation_domain =
  foreign "g_option_group_set_translation_domain" (ptr t_typ @-> string @-> returning (void))
let unref =
  foreign "g_option_group_unref" (ptr t_typ @-> returning (void))
