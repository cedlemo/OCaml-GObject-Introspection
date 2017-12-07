open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "DBus_interface_info"

let f_ref_count = field t_typ "ref_count" (int32_t)
let f_name = field t_typ "name" (string)
(*Struct field DBus_interface_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field DBus_interface_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field DBus_interface_info : C Array type for Types.Array tag tag not implemented*)
(*Struct field DBus_interface_info : C Array type for Types.Array tag tag not implemented*)
let _ = seal t_typ

let cache_build =
  foreign "g_dbus_interface_info_cache_build" (ptr t_typ @-> returning (void))

let cache_release =
  foreign "g_dbus_interface_info_cache_release" (ptr t_typ @-> returning (void))

let generate_xml =
  foreign "g_dbus_interface_info_generate_xml" (ptr t_typ @-> uint32_t @-> ptr String.t_typ @-> returning (void))

let lookup_method =
  foreign "g_dbus_interface_info_lookup_method" (ptr t_typ @-> string @-> returning (ptr DBus_method_info.t_typ))

let lookup_property =
  foreign "g_dbus_interface_info_lookup_property" (ptr t_typ @-> string @-> returning (ptr DBus_property_info.t_typ))

let lookup_signal =
  foreign "g_dbus_interface_info_lookup_signal" (ptr t_typ @-> string @-> returning (ptr DBus_signal_info.t_typ))

let ref =
  foreign "g_dbus_interface_info_ref" (ptr t_typ @-> returning (ptr t_typ))

let unref =
  foreign "g_dbus_interface_info_unref" (ptr t_typ @-> returning (void))

