open Ctypes

type t
val t_typ : t structure typ
(* Not implemented g_variant_builder_new argument types not handled . *)
(* Not implemented g_variant_builder_add_value argument types not handled . *)
val close:
t structure ptr -> unit
(* Not implemented g_variant_builder_end return type not handled . *)
(* Not implemented g_variant_builder_open argument types not handled . *)
(* Not implemented g_variant_builder_ref return type not handled . *)
val unref:
t structure ptr -> unit

