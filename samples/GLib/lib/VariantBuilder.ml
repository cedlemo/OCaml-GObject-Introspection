open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "VariantBuilder"
(* Not implemented g_variant_builder_new argument types not handled . *)
(* Not implemented g_variant_builder_add_value argument types not handled . *)
let close =
foreign "g_variant_builder_close" (ptr t_typ @-> returning (void))
(* Not implemented g_variant_builder_end return type not handled . *)
(* Not implemented g_variant_builder_open argument types not handled . *)
(* Not implemented g_variant_builder_ref return type not handled . *)
let unref =
foreign "g_variant_builder_unref" (ptr t_typ @-> returning (void))

