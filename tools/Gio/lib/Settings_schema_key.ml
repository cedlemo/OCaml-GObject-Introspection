open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Settings_schema_key"

let get_default_value =
  foreign "g_settings_schema_key_get_default_value" (ptr t_typ @-> returning (ptr Variant.t_typ))

let get_description =
  foreign "g_settings_schema_key_get_description" (ptr t_typ @-> returning (string))

let get_name =
  foreign "g_settings_schema_key_get_name" (ptr t_typ @-> returning (string))

let get_range =
  foreign "g_settings_schema_key_get_range" (ptr t_typ @-> returning (ptr Variant.t_typ))

let get_summary =
  foreign "g_settings_schema_key_get_summary" (ptr t_typ @-> returning (string))

let get_value_type =
  foreign "g_settings_schema_key_get_value_type" (ptr t_typ @-> returning (ptr Variant_type.t_typ))

let range_check =
  foreign "g_settings_schema_key_range_check" (ptr t_typ @-> ptr Variant.t_typ @-> returning (bool))

let ref =
  foreign "g_settings_schema_key_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_settings_schema_key_unref" (ptr t_typ @-> returning (void))

