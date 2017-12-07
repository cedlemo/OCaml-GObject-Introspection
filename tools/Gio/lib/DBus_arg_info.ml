open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "DBus_arg_info"

let f_ref_count = field t_typ "ref_count" (int32_t)
let f_name = field t_typ "name" (string)
let f_signature = field t_typ "signature" (string)
(*Struct field DBus_arg_info : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ

let ref =
  foreign "g_dbus_arg_info_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_dbus_arg_info_unref" (ptr t_typ @-> returning (void))

