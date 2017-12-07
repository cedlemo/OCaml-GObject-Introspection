open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "DBus_annotation_info"

let f_ref_count = field t_typ "ref_count" (int32_t)
let f_key = field t_typ "key" (string)
let f_value = field t_typ "value" (string)
(*Struct field DBus_annotation_info : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ

let ref =
  foreign "g_dbus_annotation_info_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_dbus_annotation_info_unref" (ptr t_typ @-> returning (void))

(*Not implemented g_dbus_annotation_info_lookup argument typeC Array type for Types.Array tag not handled*)
