open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_variant_dict_new argument types not handled . *)
val clear:
t structure ptr -> unit
val contains:
t structure ptr -> string -> bool
(* Not implemented g_variant_dict_end return type not handled . *)
(* Not implemented g_variant_dict_insert_value argument types not handled . *)
(* Not implemented g_variant_dict_lookup_value argument types not handled . *)
(* Not implemented g_variant_dict_ref return type not handled . *)
val remove:
t structure ptr -> string -> bool
val unref:
t structure ptr -> unit

