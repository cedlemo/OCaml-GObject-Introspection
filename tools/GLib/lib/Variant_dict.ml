open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Variant_dict"
let _new =
foreign "g_variant_dict_new" (ptr t_typ @-> ptr_opt Variant.t_typ @-> returning (ptr t_typ))

let clear =
foreign "g_variant_dict_clear" (ptr t_typ @-> returning (void))

let contains =
foreign "g_variant_dict_contains" (ptr t_typ @-> string @-> returning (bool))

let _end =
foreign "g_variant_dict_end" (ptr t_typ @-> returning (ptr Variant.t_typ))

let insert_value =
foreign "g_variant_dict_insert_value" (ptr t_typ @-> string @-> ptr Variant.t_typ @-> returning (void))

let lookup_value =
foreign "g_variant_dict_lookup_value" (ptr t_typ @-> string @-> ptr_opt Variant_type.t_typ @-> returning (ptr Variant.t_typ))

let ref =
foreign "g_variant_dict_ref" (ptr t_typ @-> returning (ptr t_typ))

let remove =
foreign "g_variant_dict_remove" (ptr t_typ @-> string @-> returning (bool))

let unref =
foreign "g_variant_dict_unref" (ptr t_typ @-> returning (void))


