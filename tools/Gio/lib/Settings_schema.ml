open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "Settings_schema"

let get_id =
  foreign "g_settings_schema_get_id" (ptr t_typ @-> returning (string))

let get_key =
  foreign "g_settings_schema_get_key" (ptr t_typ @-> string @-> returning (ptr Settings_schema_key.t_typ))

let get_path =
  foreign "g_settings_schema_get_path" (ptr t_typ @-> returning (string))

let has_key =
  foreign "g_settings_schema_has_key" (ptr t_typ @-> string @-> returning (bool))

(*Not implemented g_settings_schema_list_children return type C Array type for Types.Array tag not handled*)
(*Not implemented g_settings_schema_list_keys return type C Array type for Types.Array tag not handled*)
let ref =
  foreign "g_settings_schema_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_settings_schema_unref" (ptr t_typ @-> returning (void))

