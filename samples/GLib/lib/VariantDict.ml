open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "VariantDict"
(* Not implemented g_variant_dict_new argument types not handled . *)
let clear =
foreign "g_variant_dict_clear" (ptr t_typ @-> returning (void))
let contains =
foreign "g_variant_dict_contains" (ptr t_typ @-> string @-> returning (bool))
(* Not implemented g_variant_dict_end return type not handled . *)
(* Not implemented g_variant_dict_insert_value argument types not handled . *)
(* Not implemented g_variant_dict_lookup_value argument types not handled . *)
(* Not implemented g_variant_dict_ref return type not handled . *)
let remove =
foreign "g_variant_dict_remove" (ptr t_typ @-> string @-> returning (bool))
let unref =
foreign "g_variant_dict_unref" (ptr t_typ @-> returning (void))

